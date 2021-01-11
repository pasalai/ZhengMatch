from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render
from pingtai.models import CtfCategory, CtfQuestions, MatchInfo, Achievement
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from datetime import datetime


# Create your views here.

@login_required
def HelloWorld(request):
    return HttpResponse("Hello!")


@login_required
def getIndexPage(request):
    user = request.user
    select_match_infos = MatchInfo.objects.all()
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
    user = request.user.username
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
                match_questions_info = zip(questions_id, questions_title, questions_content, question_tips, question_fraction,
                                           question_ctf_category)
                return render(request, "match.html",
                              {'match_infos': match_infos, 'match_questions_info': match_questions_info, 'user': user})
            else:
                return HttpResponse(content="<script>alert('当前用户尚未报名本比赛')</script>", content_type="text/html", status='403')
        else:
            return HttpResponse(content='<script>alert("比赛已经结束")</script>', status='403')
    else:
        return HttpResponse(content='<script>alert("比赛尚未开始")</script>', status='403')


@login_required
def pushFlag(request):
    question_id = request.POST.get('question_id')
    match_id = request.POST.get('match_id')
    flag = request.POST.get('flag')
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
            count.answered_question_id = count.answered_question_id+'/'+question_id
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

# 创建CTF题目类型的函数
# 向 /addctfcategory/ POST 传值 CtfCategoryName
# def addCtfCategory(request):
#     newCtfCategory = CtfCategory()
#     newCtfCategory.category_name = request.POST.get('CtfCategoryName')
#     try:
#         newCtfCategory.save()
#         return HttpResponse('Ctf类型' + request.POST.get('CtfCategoryName') + '创建成功！')
#     except:
#         return HttpResponse('Ctf类型' + request.POST.get('CtfCategoryName') + '创建失败！')
#
#
# 向题库添加题目的函数
#
# def addQuestion(request):
#     newQuestion = CtfQuestions()
#     newQuestion.question_title = request.POST.get('CtfQuestionTitle')
#     newQuestion.question_content = request.POST.get('CtfQuestionContent')
#     newQuestion.question_type = request.POST.get('CtfQuestionType')
#     newQuestion.question_answer = request.POST.get('CtfQuestionAnswer')
#     newQuestion.question_tips = request.POST.get('CtfQuestionTips')
#     newQuestion.question_fraction = request.POST.get('CtfQuestionFraction')
#     newQuestion.question_ctf_category = request.POST.get('CtfQuestionCtfCategory')
#     newQuestion.docker_path = request.POST.get('DockerPath')
#     try:
#         newQuestion.save()
#         return HttpResponse('题目' + request.POST.get('CtfQuestionTitle') + '入库成功！')
#     except:
#         return HttpResponse('题目' + request.POST.get('CtfQuestionTitle') + '入库成功！')
