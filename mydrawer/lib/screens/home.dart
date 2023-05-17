import 'package:flutter/material.dart';
import 'package:odev/utils/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  List<Widget> menuitems = [
    const Text('anasayfa'),
    const Text('kurumsal'),
    const Text('iletişim'),
    const Text('ayarlar'),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: selectedindex == 0 ? Colors.amber : Colors.black87),
            label: 'anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_browser_rounded,
                color: selectedindex == 1 ? Colors.amber : Colors.black87),
            label: 'kurumsal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone,
                color: selectedindex == 2 ? Colors.amber : Colors.black87),
            label: 'iletişim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,
                color: selectedindex == 3 ? Colors.amber : Colors.black87),
            label: 'ayarlar',
          )
        ],
        currentIndex: selectedindex,
        selectedItemColor: Colors.amber,
        onTap: (int index) {
          setState(() {
            selectedindex = index;
          });
        },
      ),
      drawer:const MyDrawer(),
      appBar: AppBar(
        title: const Text("hoşgeldiniz!"),
      ),
      body: Center(
        child: menuitems[selectedindex],
      ),
    );
  }
}