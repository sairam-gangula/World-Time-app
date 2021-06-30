import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};
  Map datas={};
  @override
  Widget build(BuildContext context) {

   datas=  {"datakey":ModalRoute.of(context)!.settings.arguments};
   //What the bang(!) operator does is that by using it after a nullable value, you are assuring dart that the value will definitely not be null.
   data=  data.isNotEmpty ? data :datas["datakey"];
   print(data);

   //set background
   String bgImage= data['isDaytime'] ? 'day1.jpg' : 'night.jpg';


    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1.0), BlendMode.dstATop),
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,180.0,0,0),
          child: Column(
            children: <Widget>[
              TextButton.icon(
                onPressed: () async {
                 dynamic result = await Navigator.pushNamed(context, '/location');
                 setState(() {
                   data = {
                     'time': result['time'],
                     'location':result['location'],
                     'isDaytime':result['isDaytime'],
                     'date':result['date'],
                     'flag':result['flag'],

                   };
                 });
                 },
                icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                ),
                label: Text("Edit Location"),
                style: TextButton.styleFrom(
                  primary: Colors.grey[300],
                  textStyle: TextStyle( fontSize: 17,fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(height : 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style:TextStyle(
                      color: Colors.grey[300],
                      fontSize: 35.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['date'],
                style:TextStyle(
                  color: Colors.grey[300],
                  fontSize: 25.0,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style:TextStyle(
                  color: Colors.grey[300],
                  fontSize: 60.0,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
