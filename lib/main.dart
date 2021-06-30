import 'package:flutter/material.dart';
import 'package:w_time/pages/choose_location.dart';
import 'package:w_time/pages/home.dart';
import 'package:w_time/pages/loading.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));
