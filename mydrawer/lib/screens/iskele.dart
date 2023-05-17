import 'package:flutter/material.dart';

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  num sayi1 = 0, sayi2 = 0, sonuc = 0;

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  sayiTopla() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 + sayi2;
    });
  }

  sayiCikar() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 - sayi2;
    });
  }

  sayiCarp() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 * sayi2;
    });
  }

  sayiBol() {
    setState(() {
      sayi1 = num.parse(t1.text);
      sayi2 = num.parse(t2.text);
      sonuc = sayi1 / sayi2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Text("$sonuc"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 250, vertical: 50),
              child: TextField(
                controller: t1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 250, vertical: 50),
              child: TextField(
                controller: t2,
              ),
            ),
            Text("$sonuc"),
            TextField(
              controller: t1,
            ),
            TextField(
              controller: t2,
            ),
            ElevatedButton(onPressed: sayiTopla(), child: const Text("+")),
            ElevatedButton(onPressed: sayiCikar, child: const Text("-")),
            ElevatedButton(onPressed: sayiCarp, child: const Text("*")),
            ElevatedButton(onPressed: sayiBol, child: const Text("/")),
          ],
        ),
      ),
    );
  }
}
