from django.shortcuts import render
from rest_framework import generics

# Create your views here.
from todos import models
from .serializers import TodoSerializer

class ListTodo(generics.ListCreateAPIView):
	queryset = models.Todo.objects.all()
	serializer_class = TodoSetialize

class DerailTodo(generics.RetriveUpdateDestroyAPIView):
	queryset = models.Todo.objects.all()
	serializer_class = TodoSetialize

