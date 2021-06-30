import 'package:flutter/material.dart';
import 'package:w_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin',flag: ' germany.png',url:'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      //it is a map and we are sending key value pairs to the home page
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'date': instance.date,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child:SpinKitRing(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
