# Generated by Django 3.1.4 on 2021-01-18 11:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pingtai', '0003_auto_20210118_1102'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ctfquestions',
            name='if_docker',
            field=models.CharField(blank=True, choices=[('1', '是'), ('0', '否')], max_length=1),
        ),
    ]
