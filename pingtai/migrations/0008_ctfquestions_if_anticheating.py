# Generated by Django 3.1.4 on 2021-02-27 11:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pingtai', '0007_auto_20210227_1121'),
    ]

    operations = [
        migrations.AddField(
            model_name='ctfquestions',
            name='if_AntiCheating',
            field=models.CharField(blank=True, choices=[('1', '是'), ('0', '否')], max_length=1),
        ),
    ]
