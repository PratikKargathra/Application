import 'package:flutter/material.dart';

class TodoApp{
  String todo;
  String time;
  String title;
  bool isOpen;

  TodoApp({
    required this.todo,
    required this.time,
    required this.title,
    required this.isOpen,
});
}

List<TodoApp> todoList = <TodoApp>[];