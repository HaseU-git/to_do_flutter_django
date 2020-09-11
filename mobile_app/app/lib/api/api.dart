import 'dart:convert';
import 'package:app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {
  TodoProvider() {
    this.fetchTask();
  }

  List<Todo> _todos = [];

  List<Todo> get todos {
    return [..._todos];
  }

  void addTodo(Todo todo) async {
    final response = await http.post(
        "http://127.0.0.1:8000/apis/v1/",
        headers: {"Content-Type": "application/json"},
        body: json.encode(todo));
    if (response.statusCode == 201) {
      todo.id = json.decode(response.body)["id"];
      _todos.add(todo);
      notifyListeners();
    }
  }

  void deleteTodo(Todo todo) async{
    final response = await http.delete('http://127.0.0.1:8000/apis/v1/${todo.id}/');
    if (response.statusCode == 204) {
      _todos.remove(todo);
      notifyListeners();
    }
  }

  fetchTask() async {
    final url = "http://127.0.0.1:8000/apis/v1/?format=json";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
    }
  }
}
