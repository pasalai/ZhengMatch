from django.db import models


# Create your models here.

class CtfCategory(models.Model):
    category_id = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=20)

    def __str__(self):
        return str(self.category_id)

    class Meta:
        verbose_name = "CTF类型"
        verbose_name_plural = "CTF类型"


class ChooseQuestions(models.Model):
    question_id = models.AutoField(primary_key=True)
    question_content = models.TextField()
    question_options = models.TextField()
    question_answer = models.CharField(max_length=255)

    def __str__(self):
        return str(self.question_id)

    class Meta:
        verbose_name = "选择题题库"
        verbose_name_plural = "选择题题库"


class CtfQuestions(models.Model):
    question_id = models.AutoField(primary_key=True)
    question_title = models.CharField(max_length=255)
    question_content = models.TextField()
    question_tips = models.TextField()
    question_answer = models.CharField(max_length=255)
    question_fraction = models.CharField(max_length=255)
    question_type_choose = (('Choose', 'Choose'), ('SAQ', 'SAQ'), ('CTF', 'CTF'), ('AWD', 'AWD'))
    question_type = models.CharField(max_length=6, choices=question_type_choose)
    question_ctf_category_choose = [('', '------')]
    get_CtfCategory = CtfCategory.objects.all()
    for CtfCategory_item in get_CtfCategory:
        question_ctf_category_choose = question_ctf_category_choose + [
            (CtfCategory_item.category_name, CtfCategory_item.category_name)]
    question_ctf_category = models.CharField(max_length=20, choices=question_ctf_category_choose)
    docker_path = models.CharField(max_length=200, blank=True)

    def __str__(self):
        return self.question_title

    class Meta:
        verbose_name = 'CTF题库'
        verbose_name_plural = 'CTF题库'


class MatchInfo(models.Model):
    match_id = models.AutoField(primary_key=True)
    match_name = models.CharField(max_length=40, default='新建比赛')
    match_content = models.CharField(max_length=50, default='暂无简介')
    match_start_time = models.DateTimeField()
    match_stop_time = models.DateTimeField()
    match_user = models.TextField()
    match_questions = models.TextField()

    def __str__(self):
        return self.match_name

    class Meta:
        verbose_name = "赛事信息"
        verbose_name_plural = "赛事信息"


class Notice(models.Model):
    match_id_choose = [(0, '全局通知')]
    get_MatchInfo = MatchInfo.objects.all()
    for MatchInfo_item in get_MatchInfo:
        match_id_choose = match_id_choose + [
            (MatchInfo_item.match_id, MatchInfo_item.match_name)]
    # print(match_id_choose)
    notice_id = models.AutoField(primary_key=True)
    match_id = models.IntegerField(choices=match_id_choose, blank=True)
    notice_content = models.TextField()
    notice_time = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.notice_content

    class Meta:
        verbose_name = "公告"
        verbose_name_plural = "公告"


class WriteUp(models.Model):
    user_id = models.CharField(max_length=255, default='')
    match_id = models.IntegerField()
    file_path = models.CharField(max_length=255, default='')

    def __str__(self):
        return self.user_id + str(self.match_id) + str(self.match_id)

    class Meta:
        verbose_name = "题解"
        verbose_name_plural = "题解"


class Achievement(models.Model):
    id = models.AutoField(primary_key=True)
    match_id = models.IntegerField(verbose_name='比赛ID')
    user_id = models.CharField(max_length=255, default='', verbose_name='用户ID')
    had_answer_question_id = models.TextField(verbose_name='已解题目')
    achievement = models.IntegerField(verbose_name='当前成绩')

    def __str__(self):
        return str(self.id) + str(self.match_id) + self.user_id

    class Meta:
        verbose_name = "成绩及答题状态管理"
        verbose_name_plural = "成绩及答题状态管理"