# Generated by Django 3.1.4 on 2021-03-07 16:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pingtai', '0009_auto_20210227_1200'),
    ]

    operations = [
        migrations.AlterField(
            model_name='choosequestions',
            name='question_answer',
            field=models.CharField(max_length=255, verbose_name='答案'),
        ),
        migrations.AlterField(
            model_name='choosequestions',
            name='question_content',
            field=models.TextField(verbose_name='问题内容'),
        ),
        migrations.AlterField(
            model_name='choosequestions',
            name='question_id',
            field=models.AutoField(primary_key=True, serialize=False, verbose_name='问题编号'),
        ),
        migrations.AlterField(
            model_name='choosequestions',
            name='question_options',
            field=models.TextField(verbose_name='问题选项'),
        ),
        migrations.AlterField(
            model_name='ctfcategory',
            name='category_id',
            field=models.AutoField(primary_key=True, serialize=False, verbose_name='类型编号'),
        ),
        migrations.AlterField(
            model_name='ctfcategory',
            name='category_name',
            field=models.CharField(max_length=20, verbose_name='类型名称'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='docker_Hub',
            field=models.CharField(blank=True, max_length=200, verbose_name='DockerHub地址'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='docker_file',
            field=models.FileField(blank=True, upload_to='./upload/upload_docker_file', verbose_name='部署到Docker的文件'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='docker_type',
            field=models.TextField(blank=True, choices=[('WebFile', 'WebFile'), ('FromDockerHub', 'FromDockerHub')], verbose_name='Docker源'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='if_AntiCheating',
            field=models.CharField(choices=[('1', '是'), ('0', '否')], max_length=1, verbose_name='是否启用反作弊'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='if_docker',
            field=models.CharField(choices=[('1', '是'), ('0', '否')], max_length=1, verbose_name='是否使用Docker'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='question_answer',
            field=models.CharField(max_length=255, verbose_name='答案'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='question_content',
            field=models.TextField(verbose_name='问题内容'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='question_ctf_category',
            field=models.CharField(choices=[('', '------'), ('Misc', 'Misc'), ('Android', 'Android'), ('Web', 'Web'), ('PWN', 'PWN'), ('Reverse', 'Reverse'), ('Crypto', 'Crypto')], max_length=20, verbose_name='CTF 类型'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='question_fraction',
            field=models.CharField(max_length=255, verbose_name='分值'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='question_id',
            field=models.AutoField(primary_key=True, serialize=False, verbose_name='问题编号'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='question_tips',
            field=models.TextField(verbose_name='提示'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='question_title',
            field=models.CharField(max_length=255, verbose_name='问题标题'),
        ),
        migrations.AlterField(
            model_name='ctfquestions',
            name='question_type',
            field=models.CharField(choices=[('Choose', 'Choose'), ('SAQ', 'SAQ'), ('CTF', 'CTF'), ('AWD', 'AWD')], max_length=6, verbose_name='问题类型'),
        ),
        migrations.AlterField(
            model_name='writeup',
            name='writeup_file',
            field=models.FileField(default='', max_length=255, upload_to='./static/upload/upload_WriteUp_file'),
        ),
    ]
