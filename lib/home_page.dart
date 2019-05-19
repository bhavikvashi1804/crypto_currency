import 'dart:convert';

import 'package:cryptocurrency_app/data/cyrpto_data.dart';
import 'package:cryptocurrency_app/modules/crypto_present.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements CryptoListViewContract{
  

  final List<MaterialColor> _colors= [Colors.blue,Colors.indigo,Colors.orange];
  CryptoListPresenter _presenter;
  List<Crypto> _currencies;
  bool _isLoading;

  _MyHomePageState()
  {
    _presenter=new CryptoListPresenter(this);
  }

  @override
  void initState() {
    _isLoading=true;
    _presenter.loadCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto"),
      ),
      body: _isLoading ? new Center( child: CircularProgressIndicator(),): _CryptoWidget(),
    );
  }


  Widget _CryptoWidget()
  {
    return Container(
        child:Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                itemCount: _currencies.length,
                itemBuilder: (BuildContext context,int index)
                {
                  final currency=_currencies[index];
                  final MaterialColor color=_colors[index% _colors.length];

                  return getItemListUi(currency,color);

                },
              ),
            )
          ],
        )
    );
  }

  Widget getItemListUi(Crypto currency, MaterialColor color)
  {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency.name[0]),
      ),
      title: Text(
        currency.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle:_getSubtitleText(currency.price_usd,currency.percent_change_1h),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String price,String perChange)
  {
    TextSpan priceTextWidget =new TextSpan(text: "\$$price\n",style: TextStyle(color:Colors.black));
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

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
    setState(() {
      _currencies= items;
      _isLoading=false;
    });
  }

  @override
  void onLoadCryptoError() {

  }
}