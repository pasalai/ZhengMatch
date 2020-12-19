# ZhengMatch
# 崝赛——网络安全赛事比赛平台    Ctf、AWD、简答、选择    赛事管理、选手管理、题目创建、赛事编排

## 开发进度  
  
后台实现了差不多1/2了，前台不到1/3，额  


## 数据库设计（这个不对，但是我懒得改了）  
```
DateBase:ZhengMatch  
Tables:[ctf_category,choose_questions,ctf_questions,match_info,writeup_file,notice]
ctf_category:
    category_id
    category_name
choose_questions:
    question_id
    question_content
    question_options
    question_answer
ctf_questions:
    question_id
    question_title
    question_content
    question_tips
    question_answer
    question_fraction
    question_type
    question_ctf_category
    question_docker
match_info:
    match_id
    match_name
    match_start_time
    match_stop_time
    match_user
    match_questions
writeup:
    user_id
    match_id
    file_path
notice:
    notice_id
    match_id
    notice_content
    notice_time
```


> 请遵循Apache-2.0 License