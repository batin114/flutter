import 'package:flutter/material.dart';
import 'screens/hesap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Benim Projem",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        // home: const Nalan());
        // home: const Toplama());
        home: const Calculator());
  }
}
