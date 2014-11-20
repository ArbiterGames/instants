from django.db import models


class Item(models.Model):
    created_on = models.DateTimeField(auto_now_add=True)
    name = models.CharField(max_length=100, null=True, blank=True)
    is_active = models.BooleanField(default=True)
