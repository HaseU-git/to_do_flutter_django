import 'dart:convert';
import 'package:app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TOdoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos {
    return [..._todos];
  }

  fetchTask() async {
    final url = "http://127.0.0.1:8000/apis/v1/?format=json";
    final response = await http.get(url);
    if (response.statusCode==200){
      var data = json.decode(response.body) as List;
      _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
    }
  }
}