from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render
from django.conf import settings
from pingtai.models import CtfCategory, CtfQuestions, MatchInfo, Achievement, Notice, WriteUp, Uphistory
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from datetime import datetime
import docker
import tarfile
import os


# Create your views here.

@login_required
def HelloWorld(request):
    return HttpResponse("Hello!")


@login_required
def getIndexPage(request):
    user = request.user
    select_match_infos = MatchInfo.objects.all().order_by('match_start_time')
    paginator = Paginator(select_match_infos, 5)
    page = request.GET.get('page')
    try:
        match_infos = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        match_infos = paginator.page(1)
    except EmptyPage:
        match_infos = paginator.page(paginator.num_pages)
    return render(request, "index.html", {'match_infos': match_infos, 'user': user})


@login_required
def getMatchPage(request):
    matchID = request.GET.get('id')
    user = request.user
    try:
        chengji = Achievement.objects.all().filter(user_id=user.id).filter(match_id=matchID)[0].achievement
    except:
        chengji = 0
    match_user = MatchInfo.objects.all().filter(match_id=matchID)[0].match_user.split('/')
    match_start_time = MatchInfo.objects.all().filter(match_id__exact=matchID)[0].match_start_time.replace(tzinfo=None)
    match_stop_time = MatchInfo.objects.all().filter(match_id__exact=matchID)[0].match_stop_time.replace(tzinfo=None)
    cur_time = datetime.now()
    if match_start_time <= cur_time:
        if match_stop_time > cur_time:
            if str(user) in match_user:
                match_infos = MatchInfo.objects.all().filter(match_id__exact=matchID)[0]
                match_questions = MatchInfo.objects.all().filter(match_id__exact=matchID)[0].match_questions.split('/')
                questions_id = []
                questions_title = []
                questions_content = []
                question_tips = []
                question_fraction = []
                question_ctf_category = []
                for i in match_questions:
                    questions_ti = CtfQuestions.objects.all().filter(question_id__exact=i)[0]
                    questions_id.append(questions_ti.question_id)
                    questions_title.append(questions_ti.question_title)
                    questions_content.append(questions_ti.question_content)
                    question_tips.append(questions_ti.question_tips)
                    question_fraction.append(questions_ti.question_fraction)
                    question_ctf_category.append(questions_ti.question_ctf_category)
                match_questions_info = zip(questions_id, questions_title, questions_content, question_tips,
                                           question_fraction,
                                           question_ctf_category)
                return render(request, "match.html",
                              {'match_infos': match_infos, 'match_questions_info': match_questions_info, 'user': user,
                               'chengji': chengji})
            else:
                return HttpResponse(content="<script>alert('当前用户尚未报名本比赛')</script>", content_type="text/html",
                                    status='403')
        else:
            return HttpResponse(content='<script>alert("比赛已经结束")</script>', status='403')
    else:
        return HttpResponse(content='<script>alert("比赛尚未开始")</script>', status='403')


@login_required
def pushFlag(request):
    question_id = request.POST.get('question_id')
    match_id = request.POST.get('match_id')
    flag = request.POST.get('flag')
    # 写提交记录用于反作弊
    up_flag = Uphistory()
    up_flag.user_id = request.user.id
    up_flag.user_name = request.user.username
    up_flag.match_id = match_id
    up_flag.match_title = MatchInfo.objects.all().filter(match_id__exact=match_id)[0].match_name
    up_flag.upload_flag = flag
    # 判断本题是否启用了反作弊
    if_anticheating = CtfQuestions.objects.all().filter(question_id__exact=question_id)[0].if_AntiCheating
    # 判断是否作弊
    if if_anticheating == "1":
        had_flag = Uphistory.objects.all().filter(match_id__exact=match_id)
        for i in range(0, len(had_flag)):
            old_flag = had_flag[i].upload_flag
            if request.user.id != had_flag[i].user_id:  # 排除自己重复提交的flag
                if flag == old_flag:
                    up_flag.if_cheating = "1"
                    break
                else:
                    up_flag.if_cheating = "0"
    else:
        up_flag.if_cheating = "0"
    up_flag.save()
    # print(question_id, flag)
    question_answer = CtfQuestions.objects.all().filter(question_id__exact=question_id)[0]
    # print(question_answer)
    if flag == question_answer.question_answer:
        # 尝试读取选手在本次比赛的解题成绩
        try:
            count = Achievement.objects.all().filter(user_id__exact=request.user.id).filter(match_id=match_id)[0]
            answered_questions = count.answered_question_id.split('/')
            if question_id in answered_questions:
                return HttpResponse('<script>alert("这个题已经做过了")</script>')
            count.answered_question_id = count.answered_question_id + '/' + question_id
            fenshu = CtfQuestions.objects.all().filter(question_id__exact=question_id)[0].question_fraction
            count.achievement = count.achievement + int(fenshu)
            count.save()
        except:
            count = Achievement()
            count.match_id = match_id
            count.user_id = request.user.id
            count.answered_question_id = question_id
            fenshu = CtfQuestions.objects.all().filter(question_id__exact=question_id)[0].question_fraction
            count.achievement = int(fenshu)
            count.save()
        return HttpResponse(content='<script>alert("答案正确")</script>')
    else:
        return HttpResponse(content="<script>alert('flag错误')</script>")


@login_required
class CreateDocker:
    def __init__(self):
        self.port_list = []

    def create_docker(self):
        self.client = docker.from_env()
        container = self.client.containers.run('ubuntu', 'echo "HelloWorld!"', detach=True)
        print(container.logs())
        return container

    def rm_docker(self, docker_name):
        import os
        os.popen("docker rm -f " + str(docker_name))
        return 'OK'

    # 复制题目文件到容器中
    # copy_to('/local/foo.txt','my-container:/tmp/foo.txt')
    def copy_to(self, src, dst):
        name, dst = dst.split(':')
        container = self.client.containers.get(name)
        os.chdir(os.path.dirname(src))
        srcname = os.path.basename(src)
        tar = tarfile.open(src + '.tar', mode='w')
        try:
            tar.add(srcname)
        finally:
            tar.close()
        data = open(src + '.tar', 'rb').read()
        container.put_archive(os.path.dirname(dst), data)


@login_required
def getNotic(request):
    matchID = request.GET.get('matchID')
    select_notice = Notice.objects.all().filter(match_id__exact=matchID).order_by("notice_time")
    paginator = Paginator(select_notice, 5)
    page = request.GET.get('page')
    try:
        notice = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        notice = paginator.page(1)
    except EmptyPage:
        notice = paginator.page(paginator.num_pages)
    user = request.user
    return render(request, 'notice.html', {'notice': notice, 'user': user})


@login_required
def getuploadWriteUpFilePage(request):
    matchID = request.GET.get('matchID')
    user = request.user
    return render(request, 'uploadWriteUpFile.html', {'matchID': matchID, 'user': user}, )


@login_required
def uploadWritefile(request):
    user = request.user
    matchID = request.POST.get('matchID')
    obj = request.FILES.get('file')
    file_name = str(user.username) + "-" + str(matchID) + '.pdf'
    obj.name = file_name
    writeup = WriteUp()
    writeup.match_id = matchID
    writeup.user_id = user.id
    writeup.writeup_file = obj
    writeup.save()
    return HttpResponse('<script>alert("WriteUp上传成功")</script>')


# 反作弊烽火台
@login_required
def getAntiCheatingPage(request):
    chaeting_history = Uphistory.objects.all().filter(if_cheating__exact="1")

    return render(request, 'unticheating.html', {"cheating_history": chaeting_history})
