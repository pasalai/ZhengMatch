# Generated by Django 3.1.4 on 2021-04-26 15:32

from django.db import migrations
import multiselectfield.db.fields


class Migration(migrations.Migration):

    dependencies = [
        ('pingtai', '0017_auto_20210426_1258'),
    ]

    operations = [
        migrations.AlterField(
            model_name='matchinfo',
            name='match_questions',
            field=multiselectfield.db.fields.MultiSelectField(choices=[(1, '签到题'), (2, '心灵树洞'), (3, 'AWD-DVWA')], max_length=999, verbose_name='竞赛题目'),
        ),
        migrations.AlterField(
            model_name='matchinfo',
            name='match_user',
            field=multiselectfield.db.fields.MultiSelectField(choices=[(1, 'root'), (2, 'user'), (3, 'test'), (4, 'laishouchao')], max_length=999, verbose_name='参赛选手'),
        ),
    ]