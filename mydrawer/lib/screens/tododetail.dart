import 'package:flutter/material.dart';
import 'package:odev/models/todo.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodoDetail extends StatefulWidget {
  final Todo todo;

  const TodoDetail({super.key,required this.todo});
  @override

  State<TodoDetail> createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.todo.title} detay'),
      ),
    );
  }
}