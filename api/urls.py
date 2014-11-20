from django.conf.urls import patterns, url
from api.views import ItemHandler

urlpatterns = patterns('',
    url(r'^item/$', ItemHandler.as_view(), name='item'),
    url(r'^item/(?P<pk>[0-9]+)$', ItemHandler.as_view(), name='item'),
)
