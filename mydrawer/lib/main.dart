import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

import 'screens/counter.dart';
import 'screens/nalan.dart';
import 'screens/toplama.dart';
import 'screens/iskele.dart';
import 'screens/calc.dart';
import 'screens/counterplus.dart';
import 'screens/sayisalLoto.dart';
import 'screens/todolist_db.dart';
import 'utils/drawer.dart';
import 'screens/ortalamatik.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TodoListMysql',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/todolistdb": (context) => const TodoListMysql(),
        "/ortalamatik": (context) => const Ortalamatik(),
        "/calc": (context) => const Calculator(),
        "/nalan": (context) => const Nalan(),
        "/counter": (context) => const Counter(),
        "/counterplus": (context) => const CounterPlus(),
        "/toplama": (context) => const Toplama(),
      },

      // home: const TodoListMysql(),
    );
  }
}
