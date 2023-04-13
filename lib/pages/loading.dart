import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // Response response =
    //     await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['title']);

    //Make the Request
    Response response = await get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata'));
    Map data = jsonDecode(response.body);

    // get properties from json
    String datetime = data['datetime'];
    // print(data['utc_offset']);
    String offset = data['utc_offset'].substring(1, 3);

    //print(datetime);
    // print(offset);

    // create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset) + 1));
    now = now
        .add(Duration(minutes: -int.parse(data['utc_offset'].substring(4, 6))));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text('Loading Page'),
      ),
    );
  }
}
