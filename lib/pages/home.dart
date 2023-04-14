import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: Column(
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/changeLocation');
              },
              icon: Icon(Icons.edit_location),
              label: Text('Route'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['location'],
                  style: TextStyle(letterSpacing: 2.0, fontSize: 28.0),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              data['time'],
              style: TextStyle(fontSize: 66.0),
            ),
          ],
        ),
      )),
    );
  }
}
