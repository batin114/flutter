import 'package:flutter/material.dart';
import 'package:ortalamatik/models/models.dart';

class ortala_ extends StatefulWidget {
  const ortala_({super.key});

  @override
  State<ortala_> createState() => _Ortalamatik_State();
}

List<String> ders = ['1 Kredi', '2 Kredi', '3 Kredi', '4 Kredi'];

class _Ortalamatik_State extends State<ortala_> {
  List<Models> model = [];
  String dersAdi = "";
  final dersveri = TextEditingController();
  final notveri = TextEditingController();

  String dropdown = ders.first;
  int _kredi = 0;
  double ortalama = 0;

  void dropdownvalue() {
    setState(() {
      if (dropdown == ders[0]) {
        _kredi = 1;
      }
      if (dropdown == ders[1]) {
        _kredi = 2;
      }
      if (dropdown == ders[2]) {
        _kredi = 3;
      }
      if (dropdown == ders[3]) {
        _kredi = 4;
      }
    });
  }

  void ortalamaHesapla() {
    setState(() {
      int dersOrtalamasi = 0;
      int tumDerslerinOrtalamasi = 0;
      int toplamKredi = 0;
      if (model.isNotEmpty) {
        for (var item in model) {
          dersOrtalamasi = item.not * item.kredi;
          tumDerslerinOrtalamasi = tumDerslerinOrtalamasi + dersOrtalamasi;
          toplamKredi = toplamKredi + item.kredi;
        }
        ortalama = tumDerslerinOrtalamasi / toplamKredi;
      } else {
        ortalama = 0;
      }
    });
  }

  void dersekle() {
    setState(() {
      model.add(Models(
          id: model.isNotEmpty ? model.last.id + 1 : 1,
          baslik: dersveri.text,
          kredi: _kredi,
          not: int.parse(notveri.text)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OrtalaMatik"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add_circle_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            dropdownvalue();
            dersekle();
            ortalamaHesapla();
            dersveri.clear();
            notveri.clear();
          });
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: dersveri,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Ders Adi",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.red),
              )),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                "Ortalama :  $ortalama",
                style: const TextStyle(
                  fontSize: 36,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 25),
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.red),
              )),
            ),
          ),
          Row(children: [Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child: TextFormField(
                          controller: notveri,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Not",
                          ),
                        ),
                      ),
                    ),],),  
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 5, color: Colors.orange),
                            ),
                          ),
                          value: dropdown,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: ders.map((String ders) {
                            return DropdownMenuItem(
                              value: ders,
                              child: Text(ders),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdown = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(300, 20, 300, 20),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 5,
                  color: Colors.transparent,
                ),
                itemCount: model.length,
                itemBuilder: (BuildContext context, int index) {
                  Models ders = model[index];
                  return ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    title: InkWell(
                      child: Text(
                        " ${ders.baslik} Ders Kredisi: ${ders.kredi} Ders Notu :${ders.not}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onLongPress: () {
                      setState(() {
                        model.remove(ders);
                        ortalamaHesapla();
                      });
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}