# ZhengMatch
# 崝赛——网络安全赛事比赛平台    Ctf、AWD、简答、选择    赛事管理、选手管理、题目创建、赛事编排

[README_English](https://github.com/lsc183754539/ZhengMatch/README_English.md)
## 界面预览  
![登陆界面](https://i.jpg.dog/img/12dcb77803d8f5b9c06f992f128468b4.png)  
![赛事列表](https://i.jpg.dog/img/aeb937886675e1ada519961684e5147a.png)  
![后台预览1](https://i.jpg.dog/img/56f217176e29e53d2a3fd2772a8dfd7a.png)  
![后台预览2](https://i.jpg.dog/img/956e1f970fc7cc9b9e06b63d12d575f9.png)  


## 开发进度  
```
Null 
```


## 数据库设计 _ 有时间再写，看得懂的自己去看`models.py`
```
NULL
```

## 安装部署
```
# 下载项目文件
git clone https://github.com/lsc183754539/ZhengMatch
# 安装依赖模块
cd ZhengMatch
pip3 install -r requirements.txt  
# 修改ZhengMatch/setting.py 中的数据库连接信息
# 部署数据库（先将models.py中跨模块引用的部分注释掉执行一次成功后解除注释重新执行成功即部署完成）
python3 manage.py makemigrations
python3 manage.py migrate
# 运行项目
python3 manage.py runserver 0.0.0.0 80 # 端口信息自行设置  
```  

> 请遵循Apache-2.0 License
