import 'dart:ui';

import 'package:flutter/material.dart';


class SayisalLoto extends StatefulWidget {
  const SayisalLoto({super.key});

  @override
  State<SayisalLoto> createState() => _SayisalLotoState();
}

class _SayisalLotoState extends State<SayisalLoto> {
  int money = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text("Bakiyeniz:", style: TextStyle(fontSize: 25.0),),
                Icon(
                  Icons.attach_money,
                  size: 30.0,
                ),
                Text(
                  "$money",
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: "Sayı 1",
                            hintText: "Sayıyı Giriniz",
                            counterText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: "Sayı 2",
                            hintText: "Sayıyı Giriniz",
                            counterText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: "Sayı 3",
                            hintText: "Sayıyı Giriniz",
                            counterText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: "Sayı 4",
                            hintText: "Sayıyı Giriniz",
                            counterText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: "Sayı 5",
                            hintText: "Sayıyı Giriniz",
                            counterText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 100.0,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Rastgele Sayı")),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Oyna")),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
