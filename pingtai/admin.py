from django.contrib import admin

# Register your models here.
from .models import CtfQuestions, CtfCategory, ChooseQuestions, WriteUp, Notice, MatchInfo

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
        'question_ctf_category', 'docker_path')
    list_editable = ()
    readonly_fields = ('question_id',)
    search_fields = ('question_title',)
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (
        ('类别', {'fields': (
            'question_title', 'question_content', 'question_tips', 'question_answer', 'question_fraction',
            'question_type',
            'question_ctf_category', 'docker_path')}),
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
        ('类别', {'fields': ('question_content', 'question_options', 'question_answer')}),
    )


admin.site.register(ChooseQuestions, ChooseQuestionsAdmin)
admin.site.register(WriteUp)


class NoticeAdmin(admin.ModelAdmin):
    list_display = ('match_id', 'notice_content', 'notice_time')
    list_editable = ()
    readonly_fields = ('notice_id', 'notice_time')
    search_fields = ('notice_content',)
    empty_value_display = 'N/A'
    list_filter = ()
    fieldsets = (
        ('类别', {'fields': ('match_id', 'notice_content',)}),
    )


admin.site.register(Notice, NoticeAdmin)