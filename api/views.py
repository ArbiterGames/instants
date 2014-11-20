from django.shortcuts import get_object_or_404

from rest_framework.views import APIView
from rest_framework.response import Response

from api.models import Item
from api.serializers import ItemSerializer


class ItemHandler(APIView):

    def get(self, request, pk=None):
        """ Handles get requests to /api/<item id>
        """
        response = {'success': True}

        if pk:
            item = get_object_or_404(Item, pk=pk)
            response['item'] = ItemSerializer(item).data
        else:
            response['items'] = Item.objects.all()
        return Response(response)

    def post(self, request, pk=None):
        """ Handles POST requests to /api
        """
        response = {'success': True}
        name = request.DATA.get('name', 'John Doe')

        if pk:
            item = get_object_or_404(Item, pk=pk)
            item.name = name
            item.save()
        else:
            item = Item.objects.create(name=name)

        response['item'] = ItemSerializer(item).data
        return Response(response)
