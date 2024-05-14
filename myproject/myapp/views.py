from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from .models import Contact, Reminder
from .serializers import ContactSerializer, ReminderSerializer

class ContactViewSet(viewsets.ModelViewSet):
    queryset = Contact.objects.all()
    serializer_class = ContactSerializer

class ReminderViewSet(viewsets.ModelViewSet):
    queryset = Reminder.objects.all()
    serializer_class = ReminderSerializer