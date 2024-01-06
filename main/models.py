from django.db import models

# Create your models here.

class Letter(models.Model):
    id = models.AutoField(primary_key=True)
    typel = models.IntegerField() # тип письма (1, 2, 3)
    subject = models.CharField(max_length=200, blank=True, null=True) # тема письма
    body = models.CharField(max_length=4000, blank=True, null=True) # текст письма
    dt = models.DateTimeField() # дата отправки
    count_send = models.IntegerField(default=0) # количество отправок
    count_open = models.IntegerField(default=0) # количество открытий
    shop_id = models.IntegerField(blank=True, null=True) # ID магазина

