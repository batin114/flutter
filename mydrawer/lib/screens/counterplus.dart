import 'package:flutter/material.dart';
import 'package:odev/utils/drawer.dart';

class CounterPlus extends StatefulWidget {
  const CounterPlus({super.key});

  @override
  State<CounterPlus> createState() => _CounterPlusState();
}

class _CounterPlusState extends State<CounterPlus> {
  double _fontSize = 50.0;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    Color _textColor = Colors.black;
    if (_counter > 0) {
      _textColor = Colors.green;
    } else if (_counter == 0) {
      _textColor = Colors.black;
    } else if (_counter < 0) {
      _textColor = Colors.teal;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayaç Uygulaması'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
              hoverColor: Colors.grey,
              backgroundColor: _textColor,
            ),
            const SizedBox(height: 16),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: _fontSize,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              onPressed: _decrementCounter,
              child: const Icon(Icons.remove),
              hoverColor: Colors.grey,
              backgroundColor: _textColor,
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onLongPress: _decreaseFontSize,
        child: FloatingActionButton(
          onPressed: _increaseFontSize,
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 5.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize -= 5.0;
    });
  }
}
