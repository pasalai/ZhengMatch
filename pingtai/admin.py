from django.contrib import admin

# Register your models here.
from .models import CtfQuestions, CtfCategory, ChooseQuestions, WriteUp, Notice, MatchInfo, Achievement, Uphistory, \
    Dynamicflag

admin.site.site_title = '崝赛'
admin.site.site_header = '崝赛后台管理系统'


class MatchInfoAdmin(admin.ModelAdmin):
    """
    list_display    列表展示  用户名  学历
    list_editable   可以修改
    list_per_page   分页
    readonly_fields   只读字段
    ordering            排序
    search_fields       搜索字段
    list_filter         过滤操作
    empty_value_display   当空值时显示的内容
    fieldsets       添加或者更改页面布局
    """
    list_display = (
        'match_name', 'match_content', 'match_start_time', 'match_stop_time', 'match_user', 'match_questions',)
    list_editable = ()
    readonly_fields = ('match_id',)
    search_fields = ('match_name',)
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (
        ('比赛信息', {'fields': (
            'match_name', 'match_content', 'match_start_time', 'match_stop_time', 'match_user', 'match_questions')}),
        # ('身份信息', {'fields': ('xl',)}),
        # ('人员属性', {'fields': ('is_active', 'is_staff', 'is_superuser',)}),
    )


admin.site.register(MatchInfo, MatchInfoAdmin)


class CtfCategoryAdmin(admin.ModelAdmin):
    list_display = ('category_id', 'category_name',)
    list_editable = ()
    readonly_fields = ('category_id',)
    search_fields = ('category_name',)
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (
        ('类别', {'fields': ('category_name',)}),
    )


admin.site.register(CtfCategory, CtfCategoryAdmin)


class CtfQuestionsAdmin(admin.ModelAdmin):
    list_display = (
        'question_title', 'question_content', 'question_tips', 'question_answer', 'question_fraction', 'question_type',
        'question_ctf_category', 'if_docker', 'docker_type', 'docker_file', 'docker_Hub')
    list_editable = ()
    readonly_fields = ('question_id',)
    search_fields = ('question_title',)
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (
        ('题目信息', {'fields': (
            'question_title', 'question_content', 'question_tips', 'question_answer', 'question_fraction',
            'question_type', 'question_ctf_category',)}),
        ('Docker 信息', {'fields': ('if_docker', 'docker_type', 'docker_file', 'docker_Hub',)}),
        ('反作弊', {'fields': ('if_AntiCheating',)}),
    )


admin.site.register(CtfQuestions, CtfQuestionsAdmin)


class ChooseQuestionsAdmin(admin.ModelAdmin):
    list_display = ('question_content', 'question_options', 'question_answer')
    list_editable = ()
    readonly_fields = ('question_id',)
    search_fields = ('question_content',)
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (
        ('题目信息', {'fields': ('question_content', 'question_options', 'question_answer')}),
    )


# 选择题暂时没做，做完后解除注释即可
# admin.site.register(ChooseQuestions, ChooseQuestionsAdmin)


class WriteUpAdmin(admin.ModelAdmin):
    list_display = ('user_id', 'match_id', 'writeup_file')
    list_editable = ()
    readonly_fields = ()
    search_fields = ('match_id',)
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (
        ('解题明细管理', {'fields': ('user_id', 'match_id', 'writeup_file')}),
    )


admin.site.register(WriteUp, WriteUpAdmin)


class NoticeAdmin(admin.ModelAdmin):
    list_display = ('match_id', 'notice_content', 'notice_time')
    list_editable = ()
    readonly_fields = ('notice_id', 'notice_time')
    search_fields = ('notice_content',)
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (
        ('编辑公告', {'fields': ('match_id', 'notice_content',)}),
    )


admin.site.register(Notice, NoticeAdmin)


class AchievementAdmin(admin.ModelAdmin):
    list_display = ('match_id', 'user_id', 'answered_question_id', 'achievement')
    list_editable = ()
    readonly_fields = ('id',)
    search_fields = ('match_id', 'user_id')
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (
        ('成绩管理', {'fields': ('match_id', 'user_id', 'answered_question_id', 'achievement')}),
    )


admin.site.register(Achievement, AchievementAdmin)


class UphistoryAdmin(admin.ModelAdmin):
    list_display = ('match_id', 'match_title', 'user_id', 'user_name', 'upload_flag', 'if_cheating')
    list_editable = ()
    readonly_fields = ('id',)
    search_fields = ('match_id', 'user_id')
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (
        ('答题记录', {'fields': ('match_id', 'user_id', 'upload_flag', 'if_cheating')}),
    )


admin.site.register(Uphistory, UphistoryAdmin)


class DynamicflagAdmin(admin.ModelAdmin):
    list_display = (
        'match_id', 'match_name', 'user_id', 'user_name', 'question_id', 'container_id', 'container_address', 'flag')
    list_editable = ()
    readonly_fields = ('id',)
    search_fields = (
        'match_id', 'match_name', 'user_id', 'user_name', 'question_id', 'container_id', 'container_address', 'flag')
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (('动态flag及容器管理',
                  {'fields': (
                      'match_id', 'match_name', 'user_id', 'user_name', 'question_id', 'container_id',
                      'container_address',
                      'flag')
                  }),)


admin.site.register(Dynamicflag, DynamicflagAdmin)
