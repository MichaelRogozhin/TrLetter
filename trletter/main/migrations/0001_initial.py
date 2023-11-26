# Generated by Django 3.2.19 on 2023-11-26 20:38

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Letter',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('typel', models.IntegerField()),
                ('subject', models.CharField(blank=True, max_length=200, null=True)),
                ('body', models.CharField(blank=True, max_length=4000, null=True)),
                ('dt', models.DateTimeField()),
                ('count_send', models.IntegerField(default=0)),
                ('count_open', models.IntegerField(default=0)),
                ('shop_id', models.IntegerField(blank=True, null=True)),
            ],
        ),
    ]