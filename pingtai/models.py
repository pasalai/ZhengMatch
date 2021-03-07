from django.db import models


# Create your models here.

class CtfCategory(models.Model):
    category_id = models.AutoField(primary_key=True, verbose_name="类型编号",)
    category_name = models.CharField(max_length=20, verbose_name="类型名称",)

    def __str__(self):
        return str(self.category_id)

    class Meta:
        verbose_name = "CTF 类型管理"
        verbose_name_plural = "CTF 类型管理"


class ChooseQuestions(models.Model):
    question_id = models.AutoField(primary_key=True, verbose_name="问题编号",)
    question_content = models.TextField(verbose_name="问题内容",)
    question_options = models.TextField(verbose_name="问题选项",)
    question_answer = models.CharField(max_length=255, verbose_name="答案",)

    def __str__(self):
        return str(self.question_id)

    class Meta:
        verbose_name = "选择题题库"
        verbose_name_plural = "选择题题库"


class CtfQuestions(models.Model):
    question_id = models.AutoField(primary_key=True, verbose_name="问题编号",)
    question_title = models.CharField(max_length=255, verbose_name="问题标题",)
    question_content = models.TextField(verbose_name="问题内容",)
    question_tips = models.TextField(verbose_name="提示",)
    question_answer = models.CharField(max_length=255, verbose_name="答案",)
    question_fraction = models.CharField(max_length=255, verbose_name="分值",)
    question_type_choose = (('Choose', 'Choose'), ('SAQ', 'SAQ'), ('CTF', 'CTF'), ('AWD', 'AWD'))
    question_type = models.CharField(max_length=6, choices=question_type_choose, verbose_name="问题类型",)
    question_ctf_category_choose = [('', '------')]
    # 初次执行迁移时注释下面四行
    get_CtfCategory = CtfCategory.objects.all()
    for CtfCategory_item in get_CtfCategory:
        question_ctf_category_choose = question_ctf_category_choose + [
            (CtfCategory_item.category_name, CtfCategory_item.category_name)]
    question_ctf_category = models.CharField(max_length=20, choices=question_ctf_category_choose, verbose_name="CTF 类型",)
    if_docker_choose = (('1', '是'), ('0', '否'))
    if_docker = models.CharField(max_length=1, choices=if_docker_choose, blank=False, verbose_name="是否使用Docker",)
    docker_type_choose = (('WebFile', 'WebFile'), ('FromDockerHub', 'FromDockerHub'))
    docker_type = models.TextField(choices=docker_type_choose, blank=True, verbose_name="Docker源",)
    docker_file = models.FileField(upload_to='./static/upload/upload_docker_file', max_length=100, blank=True, verbose_name="部署到Docker的文件",)
    docker_Hub = models.CharField(max_length=200, blank=True, verbose_name="DockerHub地址",)
    if_AntiCheating = models.CharField(max_length=1, choices=if_docker_choose, blank=False, verbose_name="是否启用反作弊",)

    def __str__(self):
        return self.question_title

    class Meta:
        verbose_name = 'CTF 题库管理'
        verbose_name_plural = 'CTF 题库管理'


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
    writeup_file = models.FileField(upload_to='./static/upload/upload_WriteUp_file', max_length=255, default='')

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
    id = models.AutoField(primary_key = True)
    match_id = models.IntegerField()
    user_id = models.IntegerField()
    upload_flag = models.TextField()
    if_choose = (('1', '是'), ('0', '否'))
    if_cheating = models.CharField(max_length=1, choices=if_choose, blank=False, verbose_name="是否疑似作弊", )


    def __str__(self):
        return str(self.id) + str(self.match_id) + str(self.user_id)

    class Meta:
        verbose_name = "选手答题记录及反作弊"
        verbose_name_plural = "选手答题记录及反作弊"