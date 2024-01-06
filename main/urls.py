from django.urls import path
from . import views

urlpatterns = [
    path('', views.HomeView.as_view(), name='HomeView'),
    path('letters/', views.LettersListView.as_view(), name='LettersListView'),
    path('letters_f/<str:sfdate1>/<str:sfdate2>/', views.LettersFilteredView.as_view(), name='LettersFilteredView'),
    path('filter/', views.FilterView.as_view(), name='FilterView'),
    path('letter_new/', views.LetterNewView.as_view(), name='LetterNewView'),
]
