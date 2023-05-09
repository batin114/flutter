import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Colors.teal,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0)),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/batin.jpg"))),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("batın berke gören"),
                  )
                ],
              )),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Ana Sayfa'),
            onTap: () {
              Navigator.pushNamed(context, "/");

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_chart_outlined),
            title: const Text('NALAN'),
            onTap: () {
              Navigator.pushNamed(context, "/nalan");
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.dataset_outlined),
            title: const Text('Todo List-DB'),
            onTap: () {
              Navigator.pushNamed(context, "/todolistdb");

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Ortalamatik'),
            onTap: () {
              Navigator.pushNamed(context, "/ortalamatik");
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate_outlined),
            title: const Text('Calculator'),
            onTap: () {
              Navigator.pushNamed(context, "/calc");
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
