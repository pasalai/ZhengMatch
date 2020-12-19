from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render
from pingtai.models import CtfCategory, CtfQuestions, MatchInfo
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


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
