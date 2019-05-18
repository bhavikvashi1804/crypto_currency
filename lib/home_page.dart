import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget {

  List  Currencies;
  MyHomePage( this.Currencies);



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  final List<MaterialColor> _colors= [Colors.blue,Colors.indigo,Colors.orange];


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto"),
      ),
      body:_CryptoWidget(),
    );
  }


  Widget _CryptoWidget()
  {
    return Container(

        child: ListView.builder(
          itemCount: widget.Currencies.length,
          itemBuilder: (BuildContext context,int index)
          {
              final Map currency =widget.Currencies[index];
              //here we use widget.currencies because Currencies is object of upper class
              final MaterialColor color=_colors[index% _colors.length];

              return getItemListUi(currency,color);

          },
        ),

    );
  }

  Widget getItemListUi(Map currency, MaterialColor color)
  {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text(
        currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle:_getSubtitleText(currency['price_usd'],currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String price,String perChange)
  {
    TextSpan priceTextWidget =new TextSpan(text: "\$$price",style: TextStyle(color:Colors.black));
    TextSpan perChangeWidget;
    String perChangeText="1 hour: $perChange%";
    if(double.parse(perChange)>0)
      {
       perChangeWidget=new TextSpan(text: perChangeText,style: TextStyle(color: Colors.green));
      }
    else
      {
       perChangeWidget=new TextSpan(text: perChangeText,style: TextStyle(color: Colors.red));
      }


    return new RichText(
      text: TextSpan(
        children: [priceTextWidget,perChangeWidget]
      ),
    );

  }
}