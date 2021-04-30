from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render
# from django.conf import settings
from pingtai.models import CtfCategory, CtfQuestions, MatchInfo, Achievement, Notice, WriteUp, Uphistory, Dynamicflag
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from datetime import datetime
import os
import docker
import tarfile
import random
import string
import socket
import shutil
from hashlib import md5

# Create your views here.

# 全局变量
port_list = [80, 3306, 8080]  # docker服务器预留及已占用的端口号


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
    match_user = MatchInfo.objects.all().filter(match_id=matchID)[0].match_user
    match_start_time = MatchInfo.objects.all().filter(match_id__exact=matchID)[0].match_start_time.replace(tzinfo=None)
    match_stop_time = MatchInfo.objects.all().filter(match_id__exact=matchID)[0].match_stop_time.replace(tzinfo=None)
    cur_time = datetime.now()
    if match_start_time <= cur_time:
        if match_stop_time > cur_time:
            if str(user.id) in match_user:
                match_infos = MatchInfo.objects.all().filter(match_id__exact=matchID)[0]
                match_questions = MatchInfo.objects.all().filter(match_id__exact=matchID)[0].match_questions
                questions_id = []
                questions_title = []
                questions_content = []
                questions_docker = []
                questions_docker_address = []
                question_tips = []
                question_fraction = []
                question_ctf_category = []
                for i in match_questions:
                    questions_ti = CtfQuestions.objects.all().filter(question_id__exact=i)[0]
                    questions_id.append(questions_ti.question_id)
                    questions_title.append(questions_ti.question_title)
                    questions_content.append(questions_ti.question_content)
                    questions_docker.append(questions_ti.if_docker)
                    try:
                        address = \
                            Dynamicflag.objects.all().filter(user_id__exact=user.id).filter(
                                question_id__exact=i).filter(
                                match_id__exact=matchID)[0].container_address
                        questions_docker_address.append(address)
                    except:
                        questions_docker_address.append(0)
                    question_tips.append(questions_ti.question_tips)
                    question_fraction.append(questions_ti.question_fraction)
                    question_ctf_category.append(questions_ti.question_ctf_category)
                match_questions_info = zip(questions_id, questions_title, questions_content, question_tips,
                                           questions_docker, questions_docker_address,
                                           question_fraction,
                                           question_ctf_category)
                return render(request, "match.html",
                              {'match_infos': match_infos, 'match_questions_info': match_questions_info, 'user': user,
                               'chengji': chengji})
            else:
                return HttpResponse(content="<script>alert('您未参加该比赛，请与管理员联系');history.go(-1);</script>",
                                    status='403')
        else:
            return HttpResponse(content='<script>alert("比赛已经结束");history.go(-1);</script>', status='403')
    else:
        return HttpResponse(content='<script>alert("比赛尚未开始");history.go(-1);</script>', status='403')


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
    # 判断是否作弊
    if_anticheating = CtfQuestions.objects.all().filter(question_id__exact=question_id)[0].if_AntiCheating

    if if_anticheating == "1":
        try:
            question_answer = \
                Dynamicflag.objects.all().filter(question_id__exact=question_id).filter(
                    user_id__exact=request.user.id).filter(
                    match_id__exact=match_id)[0].flag
            if question_answer == '':
                return HttpResponse('<script>alert("请先启动容器");location.replace(document.referrer);</script>')
        except:
            return HttpResponse('<script>alert("请先启动容器");location.replace(document.referrer);</script>')
    else:
        question_answer = CtfQuestions.objects.all().filter(question_id__exact=question_id)[0].question_answer
    # print(question_answer)
    if flag == question_answer:
        # 尝试读取选手在本次比赛的解题成绩
        try:
            count = Achievement.objects.all().filter(user_id__exact=request.user.id).filter(match_id=match_id)[0]
            answered_questions = count.answered_question_id.split('/')
            if question_id in answered_questions:
                return HttpResponse('<script>alert("这个题已经做过了");location.replace(document.referrer);</script>')
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
        return HttpResponse(content='<script>alert("答案正确");location.replace(document.referrer);</script>')
    else:
        return HttpResponse(content="<script>alert('flag错误');location.replace(document.referrer);</script>")


class CreateDocker:
    def __init__(self):
        while True:
            self.random_port = random.randint(10000, 20000)
            if self.random_port not in port_list:
                print("本次将创建容器实例，映射到端口 ", self.random_port)
                break
        port_list.append(self.random_port)

    def create_docker_by_file(self):
        client = docker.from_env()
        container = client.containers.run(image='pasalai/xampp:v2',
                                          command='/bin/sh -c "while true; do echo hello world; sleep 1; done"',
                                          ports={'80': self.random_port}, detach=True)
        self.container_id = container.id
        return container.id, self.random_port

    def creat_docker_by_dockerhub(self, dockerHub):
        client = docker.from_env()
        getimage = client.images.pull(dockerHub)
        container = client.containers.run(image=dockerHub,
                                          command='/bin/sh -c "while true; do echo hello world; sleep 1; done"',
                                          ports={'80': self.random_port}, detach=True)
        self.container_id = container.id
        return container.id, self.random_port

    # 复制题目文件到容器中
    def copy_to(self, src, dst):
        name, dst = dst.split(':')
        # 指定容器
        client = docker.from_env()
        container = client.containers.get(name)

        print("======上传文件中...======")
        os.chdir(os.path.dirname(src))
        self.srcname = os.path.basename(src)
        tar = tarfile.open(src + '.tar', mode='w')
        try:
            tar.add(self.srcname)
        finally:
            tar.close()
        data = open(src + '.tar', 'rb').read()
        container.put_archive(os.path.dirname(dst), data)

    def unzip(self):
        client = docker.from_env()
        container = client.containers.get(self.container_id)
        # 解压文件
        unzip_command = 'unzip /opt/lampp/htdocs/' + self.srcname + ' -d /opt/lampp/htdocs/'
        print("======解压文件中...======")
        container.exec_run('unzip /opt/lampp/htdocs/' + self.srcname + ' -d /opt/lampp/htdocs/')
        # 启动xampp服务
        print("======启动xampp服务中...======")
        container.exec_run('/opt/lampp/lampp start')
        # 导入数据库
        print("======正在导入数据库...======")
        # echo "/opt/lampp/bin/mysql -u root --password=\'password\' match_database < /opt/lampp/htdocs/sqlfile.sql" to /opt/lampp/import.sh',
        # a = container.exec_run('sh /opt/lampp/htdocs/import.sh')
        # print(b.output.decode('utf8'))
        container.exec_run('sh /opt/lampp/htdocs/import.sh')
        # 删除sql、sh部署文件
        container.exec_run('rm /opt/lampp/htdocs/sqlfile.sql')
        # 重启xampp服务
        print("======重新启动xampp服务...======")
        container.exec_run('/opt/lampp/lampp restart')

    # 创建flag
    def set_flag(self, container_id, username):
        # 指定容器
        # client = docker.from_env()
        # container = client.containers.get(container_id)
        # 生成flag内容
        ran_str = ''.join(random.sample(string.ascii_letters + string.digits, 8))
        flag_value = 'flag{' + md5(ran_str.encode('utf8')).hexdigest() + '}'
        print("====生成flag:", flag_value, '====')

        # 尝试向docker 写入flag
        father_path = os.path.abspath(os.path.dirname(os.path.abspath(__file__)) + os.path.sep + "..")
        with open(father_path + '\\static\\flag\\flag.txt', mode='w') as fp:
            fp.write(flag_value)
            fp.close()
        print('====写入动态flag至容器' + container_id + '...====')
        self.copy_to(father_path + '\\static\\flag\\flag.txt', '%s:/opt/lampp/flag.txt' % container_id)
        return flag_value


@login_required
def createDockerContainer(request):
    matchID = request.POST.get('matchID')
    matchName = MatchInfo.objects.filter(match_id__exact=matchID)[0].match_name
    user = request.user
    question_id = request.POST.get('questionID')
    # 创建容器
    dockerContainer = CreateDocker()

    # 判断部署方式
    dockerType = CtfQuestions.objects.filter(question_id__exact=question_id)[0].docker_type
    # 使用WebFile方式部署
    if dockerType == 'WebFile':
        containerID, containerPort = dockerContainer.create_docker_by_file()
        hostname = socket.gethostname()
        containerAddress = 'http://' + str(socket.gethostbyname(hostname)) + ":" + str(containerPort)
        print(containerAddress)
        # 部署题目文件系统
        questionFilePath = CtfQuestions.objects.filter(question_id__exact=question_id)[0].docker_file.path
        print(questionFilePath)
        filename = questionFilePath.split('/')[:-1]
        print(filename)
        dockerContainer.copy_to(questionFilePath, '%s:/opt/lampp/htdocs/%s' % (containerID, filename))
        dockerContainer.unzip()
        # 生成动态flag
        flag = dockerContainer.set_flag(container_id=containerID, username=user.username)
    # 使用dockerHub方式部署
    elif dockerType == 'FromDockerHub':
        dockerHub = CtfQuestions.objects.filter(question_id__exact=question_id).docker_Hub
        containerID, containerPort = dockerContainer.creat_docker_by_dockerhub(dockerHub=dockerHub)
        hostname = socket.gethostname()
        containerAddress = 'http://' + str(socket.gethostbyname(hostname)) + ":" + str(containerPort)
        print(containerAddress)
        if_anticheating = CtfQuestions.objects.filter(question_id__exact=question_id).if_AntiCheating
        if if_anticheating == '0':
            flag = None
        else:
            flag = dockerContainer.set_flag(container_id=containerID, username=user.username)
    else:
        return HttpResponse(
            '<script>alert("Error!Heacker!Go out, Please!");location.replace(document.referrer);</script>')
    # 是否已经存在记录
    if len(Dynamicflag.objects.all().filter(match_id__exact=matchID).filter(user_id__exact=user.id)) == 0:
        # 写入记录
        sqlItem = Dynamicflag()
        sqlItem.match_id = matchID
        sqlItem.match_name = matchName
        sqlItem.user_id = user.id
        sqlItem.user_name = user.username
        sqlItem.question_id = question_id
        sqlItem.container_id = containerID
        sqlItem.container_address = containerAddress
        sqlItem.flag = flag
        sqlItem.save()
    else:
        sqlItem = Dynamicflag.objects.all().filter(match_id__exact=matchID).filter(user_id__exact=user.id)[0]
        sqlItem.container_id = containerID
        sqlItem.container_address = containerAddress
        sqlItem.flag = flag
        sqlItem.save()
    return HttpResponse(
        '<script>alert("题目环境启动成功,地址为%s");location.replace(document.referrer);;</script>' % containerAddress)


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
    father_path = os.path.abspath(os.path.dirname(os.path.abspath(__file__)) + os.path.sep + "..")
    shutil.copy(father_path + '\\static\\static\\upload\\upload_WriteUp_file\\%s' % file_name,
                father_path + '\\static\\upload\\upload_WriteUp_file\\%s' % file_name)
    return HttpResponse('<script>alert("WriteUp上传成功");location.replace(document.referrer);</script>')


# 反作弊烽火台
@login_required
def getAntiCheatingPage(request):
    chaeting_history = Uphistory.objects.all().filter(if_cheating__exact="1")
    return render(request, 'unticheating.html', {"cheating_history": chaeting_history})


@login_required
def Rank(request):
    match_id = request.GET.get('matchid')
    rank_info = Achievement.objects.all().filter(match_id__exact=match_id).order_by('achievement')
    return render(request, 'unticheating.html', {'rank_info': rank_info, })


@login_required
def getUserInfo(request, user_id):
    user_id = request.user.id
    user_name = request.user.username
    chengji_item = Achievement.objects.all().filter(user_id__exact=user_id)
    return render(request, 'user.html', {"user_id": user_id, "user_name": user_name, "chengji_item": chengji_item,})
