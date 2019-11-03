# -*- coding: utf-8 -*-

from django import forms


class LetterNewForm(forms.Form):
    Subject = forms.CharField(max_length=150, label='Тема', widget=forms.TextInput(attrs={'size': 100}), required=False)
    Body = forms.CharField(max_length=150, label='Текст', widget=forms.Textarea(attrs={'rows': 6, 'cols': 100}), required=False)
#, 'style': 'height: 1em;'
    Typel = forms.IntegerField(label='Тип письма (1, 2 или 3)')
    ShopId = forms.IntegerField(label='ID магазина', required=False)
#    CountSend = forms.IntegerField(label='Количество отправок')
#    CountOpen = forms.IntegerField(label='Количество открытий')


class FilterForm(forms.Form):
    FilterDate1 = forms.DateField(label='Начало периода', input_formats=['%d.%m.%Y'], required=True)
    FilterDate2 = forms.DateField(label='Конец периода', input_formats=['%d.%m.%Y'], required=True)
