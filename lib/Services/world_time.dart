import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

// class WorldTime {
//   String location = ''; // location name for the ui
//   String time = ''; // the time in that location
//   String flag = ''; // url to an asset flag icon
//   String url = ''; //location url for the api endpoint

//   WorldTime({required this.location, required this.flag, required this.url});
//   Future<void> getTime() async {
//     // Response response =
//     //     await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
//     // Map data = jsonDecode(response.body);
//     // print(data);
//     // print(data['title']);

//     //Make the Request
//     Response response =
//         await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
//     Map data = jsonDecode(response.body);

//     // get properties from json
//     String datetime = data['datetime'];
//     // print(data['utc_offset']);
//     String offset = data['utc_offset'].substring(1, 3);

//     //print(datetime);
//     // print(offset);

//     // create DateTime object
//     DateTime now = DateTime.parse(datetime);
//     now = now.add(Duration(hours: int.parse(offset) + 1));
//     now = now
//         .add(Duration(minutes: -int.parse(data['utc_offset'].substring(4, 6))));

// //set the time property
//     time = now.toString();
//   }
// }
class WorldTime {
  String location = ''; // location name for UI
  String time = ''; // the time in that location
  String flag = ''; // url to an asset flag icon
  String url = ''; // location url for API endpoint
  bool? isDaytime; // true if daytime, false if nighttime

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // Get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      // Create DateTime object
      DateTime now = DateTime.parse(datetime);
      if (offset[0] == '-') {
        now = now.subtract(Duration(
            hours: int.parse(offset.substring(1, 3)),
            minutes: int.parse(offset.substring(4, 6))));
      } else {
        now = now.add(Duration(
            hours: int.parse(offset.substring(1, 3)),
            minutes: int.parse(offset.substring(4, 6))));
      }

      // Check if it's daytime or nighttime
      isDaytime = now.hour >= 6 && now.hour < 20;

      // Set the time and date properties
      time = DateFormat('h:mm a').format(now);
      // String date = DateFormat('MMMM dd, yyyy').format(now);
      // time = '$time\n$date';
    } catch (e) {
      print('Error: $e');
      time = 'Could not get time data';
    }
  }
}
