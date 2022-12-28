import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double sayi1 = 0;
  double sayi2 = 0;
  double sonuc = 0;
  bool kac = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                sonuc = sayi1 + sayi2;
              });
            }),
        drawer: const Drawer(),
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: const Text("Flutter"),
          actions: const [
            Icon(Icons.settings),
            SizedBox(
              width: 5,
            )
          ],
        ),
        body: Row(
          children: [
            Container(
                alignment: Alignment.center,
                width: 390,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        if (value.isEmpty) {
                          sayi1 = 0;
                        } else {
                          sayi1 = double.parse(value);
                        }
                      },
                      initialValue: sayi1.toString(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Sayı giriniz',
                        labelText: '1. Sayı',
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        if (value.isEmpty) {
                          sayi2 = 0;
                        } else {
                          sayi2 = double.parse(value);
                        }
                      },
                      initialValue: sayi2.toString(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Sayı giriniz',
                        labelText: '2. Sayı',
                      ),
                    ),
                    const SizedBox(width: 390, height: 10),
                    Wrap(
                      children: <Widget>[
                        SizedBox(
                            width: 90,
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () {
                                  topla();
                                },
                                child: const Text("Topla"))),
                        SizedBox(
                            width: 90,
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () {
                                  cikart();
                                },
                                child: const Text("Çıkart"))),
                        SizedBox(
                          width: 90,
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                carpma();
                              },
                              child: const Text("Çarpma")),
                        ),
                        SizedBox(
                          width: 90,
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                bolme();
                              },
                              child: const Text("Bölme")),
                        ),
                      ],
                    ),
                    Text(
                      "$sonuc",
                      style: const TextStyle(fontSize: 18, color: Colors.teal),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )),
          ],
        )

        // body: Container(
        //   alignment: Alignment.center,
        //   child: Text(_counter.toString()),
        // ),
        );
  }

  topla() {
    setState(() {
      sonuc = sayi1 + sayi2;
    });
  }

  cikart() {
    setState(() {
      sonuc = sayi1 - sayi2;
    });
  }

  carpma() {
    setState(() {
      sonuc = sayi1 * sayi2;
    });
  }

  bolme() {
    setState(() {
      sonuc = sayi1 / sayi2;
    });
  }
}
