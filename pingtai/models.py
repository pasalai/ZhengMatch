from django.db import models
from multiselectfield import MultiSelectField
from django.contrib.auth.models import User

# Create your models here.

class CtfCategory(models.Model):
    category_id = models.AutoField(primary_key=True, verbose_name="类型编号", )
    category_name = models.CharField(max_length=20, verbose_name="类型名称", )

    def __str__(self):
        return str(self.category_id)

    class Meta:
        verbose_name = "CTF 类型管理"
        verbose_name_plural = "CTF 类型管理"


class ChooseQuestions(models.Model):
    question_id = models.AutoField(primary_key=True, verbose_name="问题编号", )
    question_content = models.TextField(verbose_name="问题内容", )
    question_options = models.TextField(verbose_name="问题选项", )
    question_answer = models.CharField(max_length=255, verbose_name="答案", )

    def __str__(self):
        return str(self.question_id)

    class Meta:
        verbose_name = "选择题题库"
        verbose_name_plural = "选择题题库"


class CtfQuestions(models.Model):
    question_id = models.AutoField(primary_key=True, verbose_name="问题编号", )
    question_title = models.CharField(max_length=255, verbose_name="问题标题", )
    question_content = models.TextField(verbose_name="问题内容", )
    question_tips = models.TextField(verbose_name="提示", )
    question_answer = models.CharField(max_length=255, verbose_name="答案", )
    question_fraction = models.CharField(max_length=255, verbose_name="分值", )
    question_type_choose = (('Choose', 'Choose'), ('SAQ', 'SAQ'), ('CTF', 'CTF'), ('AWD', 'AWD'))
    question_type = models.CharField(max_length=6, choices=question_type_choose, verbose_name="问题类型", )
    question_ctf_category_choose = [('', '------')]
    # 初次执行迁移时注释下面四行
    get_CtfCategory = CtfCategory.objects.all()
    for CtfCategory_item in get_CtfCategory:
        question_ctf_category_choose = question_ctf_category_choose + [
            (CtfCategory_item.category_name, CtfCategory_item.category_name)]
    question_ctf_category = models.CharField(max_length=20, choices=question_ctf_category_choose,
                                             verbose_name="CTF 类型", )
    if_docker_choose = (('1', '是'), ('0', '否'))
    if_docker = models.CharField(max_length=1, choices=if_docker_choose, blank=False, verbose_name="是否使用Docker", )
    docker_type_choose = (('WebFile', 'WebFile'), ('FromDockerHub', 'FromDockerHub'))
    docker_type = models.TextField(choices=docker_type_choose, blank=True, verbose_name="Docker源", )
    docker_file = models.FileField(upload_to='static/upload/upload_docker_file', max_length=100, blank=True,
                                   verbose_name="部署到Docker的文件", )
    docker_Hub = models.CharField(max_length=200, blank=True, verbose_name="DockerHub地址", )
    if_AntiCheating = models.CharField(max_length=1, choices=if_docker_choose, blank=False,
                                       verbose_name="是否启用动态flag及反作弊", )

    def __str__(self):
        return self.question_title

    class Meta:
        verbose_name = 'CTF 题库管理'
        verbose_name_plural = 'CTF 题库管理'


class MatchInfo(models.Model):
    match_id = models.AutoField(primary_key=True, verbose_name="竞赛ID", )
    match_name = models.CharField(max_length=40, default='新建比赛', verbose_name="竞赛名称", )
    match_content = models.CharField(max_length=50, default='暂无简介', verbose_name="竞赛简介", )
    match_start_time = models.DateTimeField(verbose_name="竞赛开始时间", )
    match_stop_time = models.DateTimeField(verbose_name="竞赛结束时间", )

    # 参赛选手多选
    user_choose_item = []
    user_list = User.objects.all()
    for item in user_list:
        user_choose_item = user_choose_item + [(item.id, item.username)]
    print(user_choose_item)
    # match_user = models.TextField(max_length=999, verbose_name="参赛选手", )
    match_user = MultiSelectField(u"参赛选手", choices=user_choose_item, null=False, blank=False, max_length=999, )

    # 题目多选
    questions_choose_item = []
    questions_list = CtfQuestions.objects.all()
    for item in questions_list:
        questions_choose_item = questions_choose_item + [(item.question_id, item.question_title)]
    print(questions_choose_item)
    # match_questions = models.TextField(max_length=999, verbose_name="竞赛题目",)
    match_questions = MultiSelectField(u"竞赛题目", choices=questions_choose_item, null=False, blank=False, max_length=999, )

    def __str__(self):
        return self.match_name

    class Meta:
        verbose_name = "赛事信息管理"
        verbose_name_plural = "赛事信息管理"


class Notice(models.Model):
    match_id_choose = [(0, '全局通知')]
    # 第一次生成数据库时，先将下面四行注释掉
    get_MatchInfo = MatchInfo.objects.all()
    for MatchInfo_item in get_MatchInfo:
        match_id_choose = match_id_choose + [
            (MatchInfo_item.match_id, MatchInfo_item.match_name)]
    notice_id = models.AutoField(primary_key=True)
    match_id = models.IntegerField(choices=match_id_choose, blank=True)
    notice_content = models.TextField()
    notice_time = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.notice_content

    class Meta:
        verbose_name = "通知公告"
        verbose_name_plural = "通知公告"


class WriteUp(models.Model):
    user_id = models.CharField(max_length=255, default='')
    match_id = models.IntegerField()
    writeup_file = models.FileField(upload_to='static/upload/upload_WriteUp_file', max_length=255, default='')

    def __str__(self):
        return str(self.user_id) + str(self.match_id)

    class Meta:
        verbose_name = "选手解题解析（WriteUp）"
        verbose_name_plural = "选手解题解析（WriteUp）"


class Achievement(models.Model):
    id = models.AutoField(primary_key=True)
    match_id = models.IntegerField()
    user_id = models.IntegerField()
    answered_question_id = models.TextField()
    achievement = models.IntegerField()

    def __str__(self):
        return str(self.id) + str(self.match_id) + str(self.user_id)

    class Meta:
        verbose_name = "成绩及解答题目"
        verbose_name_plural = "成绩及解答题目"


class Uphistory(models.Model):
    id = models.AutoField(primary_key=True)
    match_id = models.IntegerField()
    match_title = models.TextField(default=None)
    user_id = models.IntegerField()
    user_name = models.TextField(default=None)
    upload_flag = models.TextField()
    if_choose = (('1', '是'), ('0', '否'))
    if_cheating = models.CharField(max_length=1, choices=if_choose, blank=False, verbose_name="是否疑似作弊", )

    def __str__(self):
        return str(self.id) + str(self.match_id) + str(self.user_id)

    class Meta:
        verbose_name = "选手答题记录及反作弊"
        verbose_name_plural = "选手答题记录及反作弊"


class Dynamicflag(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='ID')
    match_id = models.IntegerField(verbose_name='比赛ID')
    match_name = models.TextField(default=None, blank=True,verbose_name='比赛名称')
    user_id = models.IntegerField(verbose_name='用户ID')
    user_name = models.TextField(default=None, blank=True,verbose_name='用户名')
    question_id = models.IntegerField(verbose_name='题目ID')
    container_id = models.TextField(default=None, blank=True, verbose_name='容器ID')
    container_address = models.TextField(default=None, blank=True, verbose_name='容器地址/端口')
    flag = models.TextField(default='', blank=True, verbose_name='动态Flag')

    def __str__(self):
        return str(self.id) + str(self.match_id) + str(self.user_id)

    class Meta:
        verbose_name = "动态Flag管理"
        verbose_name_plural = "动态Flag管理"
