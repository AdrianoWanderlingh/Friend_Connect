
# You’ll have models for Users, Contacts, and Reminders. Here's an example of how you might define these models
from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.models import AbstractUser

class Contact(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    birthday = models.DateField(null=True, blank=True)
    phone_number = models.CharField(max_length=15, blank=True, null=True)
    email = models.EmailField(blank=True, null=True)

class Reminder(models.Model):
    contact = models.ForeignKey(Contact, on_delete=models.CASCADE)
    date = models.DateField()
    message = models.TextField()


class CustomUser(AbstractUser):
    # Add additional fields here
    pass

# Update settings.py
AUTH_USER_MODEL = 'myapp.CustomUser'
