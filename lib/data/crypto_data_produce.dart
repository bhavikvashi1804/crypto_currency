import 'cyrpto_data.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProduceCrypto implements CryptoRepo
{
  @override
  Future<List<Crypto>> fetchCurrencies() async
  {

    String url="https://api.coinmarketcap.com/v1/ticker/?limlt=50";
    http.Response response= await http.get(url);

    final List res=jsonDecode(response.body);

    final statusCode =response.statusCode;
    if(statusCode != 200 || response.body == null  )
    {
      throw new FetchDataException("An Error has occured [Status Code:$statusCode]");
    }

    return res.map( (c) => new Crypto.fromMap(c) ).toList() ;
  }

}