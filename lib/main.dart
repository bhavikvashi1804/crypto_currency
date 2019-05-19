import 'dart:convert';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dependency_injection.dart';

void main() async{

  Injector.configure(Flavor.Produced);


  runApp(MyApp());
}

class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.purple,
        accentColor: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}


