from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.HomeView.as_view(), name='HomeView'),
    url(r'^letters/$', views.LettersListView.as_view(), name='LettersListView'),
    url(r'^letters_f/(?P<sfdate1>\d+)/(?P<sfdate2>\d+)/$', views.LettersFilteredView.as_view(), name='LettersFilteredView'),
    url(r'^filter/$', views.FilterView.as_view(), name='FilterView'),
    url(r'^letter_new/$', views.LetterNewView.as_view(), name='LetterNewView'),
]