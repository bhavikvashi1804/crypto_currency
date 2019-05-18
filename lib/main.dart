import 'dart:convert';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() async{
  List currencies=await getCurrencies();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget
{
  final List _currencies;

  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.purple,
        accentColor: Colors.pink,
      ),
      home: MyHomePage(_currencies),
    );
  }
}


Future<List> getCurrencies() async
{
  String url="https://api.coinmarketcap.com/v1/ticker/?limlt=50";
  //var response = await http
  //    .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  http.Response response= await http.get(url);
  return jsonDecode(response.body);
}

