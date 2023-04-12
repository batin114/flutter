import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  String message = '';
  int bakiye = 0;

  void oyna() {
    List<int> randomNumbers = List.generate(6, (_) => Random().nextInt(60) + 1);
    List<int> inputs = controllers
        .map((controller) => int.tryParse(controller.text) ?? 0)
        .toList();

    int correct = 0;
    for (int i = 0; i < 6; i++) {
      if (randomNumbers.contains(inputs[i])) {
        correct++;
      }
    }

    int odul = 0;
    switch (correct) {
      case 1:
        odul = 4;
        break;
      case 2:
        odul = 8;
        break;
      case 3:
        odul = 16;
        break;
      case 4:
        odul = 32;
        break;
      case 5:
        odul = 64;
        break;
      case 6:
        odul = 128;
        break;
      default:
        odul = 0;
    }

    setState(() {
      message = 'Tuttuğunuz sayılar: ${inputs.join(', ')}\n';
      message += 'Doğru sayılar: ${randomNumbers.join(', ')}\n';
      message += 'Tahmininizde ${correct} doğru cevap var.\n';
      message += 'Kazandığınız ödül: ${odul}';
      bakiye += odul;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Şans Oyunu'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 6; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controllers[i],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '${i + 1}. sayıyı girin',
                    ),
                  ),
                ),
              ElevatedButton(
                onPressed: oyna,
                child: Text('Oyna'),
              ),
              SizedBox(height: 16.0),
              Text(message),
              SizedBox(height: 16.0),
              Text('Bakiye: $bakiye'),
            ],
          ),
        ),
      ),
    );
  }
}