import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location;  // location name for the UI
  late String time; //the time in that location
  late String date; //the date in that location
  late String flag; //url to an asset flag icon
  late String url; //location url for the api endpoint
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});
  // at some point i am gonna return void but only when the async func is complete
  //future is a placeholder
  Future<void> getTime() async{

    try {
      //make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //getting the properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //creating a datetime obj
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 20? true : false;
      time = DateFormat.jm().format(now);//formats dates
      date = DateFormat('yyyy-MM-dd').format(now);

    }
    catch(t,d) {
      print('Caught Error: $t,$d');
      time = 'Could not get time data ';
      date = 'Could not get date data';
    }


  }

}

