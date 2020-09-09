from django.shortcuts import render

# Create your views here.
from todos import models
from .serializers import TodoSerializer

class ListTodo(generics.ListCreateAPIView):
	queryset = models.Todo.object.all()
	serializer_class = TodoSetialize

class DerailTodo(generics.RetriveUpdateDestroyAPIView):
	queryset = models.Todo.object.all()
	serializer_class = TodoSetialize

