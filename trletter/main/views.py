from django.shortcuts import render

import datetime
from datetime import timedelta
from django.views.generic import View
from django.shortcuts import render
from django.shortcuts import redirect
from django.utils import timezone
from main.models import Letter
from main.forms import LetterNewForm
from main.forms import FilterForm

# Create your views here.


def TYPEL_NAMES(typel):
    if typel == 1:
        res = 'О заказе'
    elif typel == 2:
        res = 'О брошенной корзине'
    elif typel == 3:
        res = '30 дней без заказа'
    else:
        res = None
    return res


class HomeView(View):
    def get(self, request, *args, **kwargs):
        context = {}
        return render(request, 'main/HomePage.html', context)


class LettersListView(View):
    def get(self, request, *args, **kwargs):
        letters = Letter.objects.all().order_by('id')
        for letter in letters:
            letter.typel_name = TYPEL_NAMES(letter.typel)
        context = {}
        context['reclist'] = letters
        return render(request, 'main/LettersListPage.html', context)


class LettersFilteredView(View):
    def get(self, request, *args, **kwargs):
        sfdate1 = kwargs['sfdate1']
        sfdate2 = kwargs['sfdate2']
        fdate1 = datetime.datetime.strptime(sfdate1, '%Y%m%d')
        fdate2 = datetime.datetime.strptime(sfdate2, '%Y%m%d')
        letters = Letter.objects.filter(dt__gte=fdate1).filter(dt__lte=fdate2+timedelta(days=1)).order_by('id') # иначе не попадает последний день
        for letter in letters:
            letter.typel_name = TYPEL_NAMES(letter.typel)
        context = {}
        context['fdate1'] = fdate1
        context['fdate2'] = fdate2
        context['reclist'] = letters
        return render(request, 'main/LettersFilteredPage.html', context)


class FilterView(View):
    form = None
    def get(self, request, *args, **kwargs):
        d1 = datetime.datetime.today().replace(day=1)
        d2 = (d1 + timedelta(days=32)).replace(day=1) - timedelta(days=1)
        ddict = {'FilterDate1': d1, 'FilterDate2': d2}
        self.form = FilterForm(ddict)
        context = {}
        context["form"] = self.form
        return render(request, 'main/FilterPage.html', context)
    def post(self, request, *args, **kwargs):
        print('!!@@')
        self.form = FilterForm(request.POST)
        if self.form.is_valid():
            FilterDate1 = self.form.cleaned_data["FilterDate1"]
            FilterDate2 = self.form.cleaned_data["FilterDate2"]
            sfdate1 = FilterDate1.strftime("%Y%m%d")
            sfdate2 = FilterDate2.strftime("%Y%m%d")
            #print('sfdate', sfdate1, sfdate2)
            return redirect('LettersFilteredView', sfdate1=sfdate1, sfdate2=sfdate2)
        else:
            return self.get(request, *args, **kwargs)


class LetterNewView(View):
    form = None
    def get(self, request, *args, **kwargs):
        self.form = LetterNewForm()
        context = {}
        context["form"] = self.form
        return render(request, 'main/LetterNewPage.html', context)

    def post(self, request, *args, **kwargs):
        self.form = LetterNewForm(request.POST)
        if self.form.is_valid():
            letter = Letter()
            letter.subject = self.form.cleaned_data["Subject"]
            letter.body = self.form.cleaned_data["Body"]
            letter.typel = self.form.cleaned_data["Typel"]
            letter.shop_id = self.form.cleaned_data["ShopId"]
            letter.dt = timezone.now()
            letter.save()
            return redirect('LettersListView')
        else:
            return self.get(request, *args, **kwargs)
#            return super(LetterNewView, self).get(request, *args, **kwargs)
