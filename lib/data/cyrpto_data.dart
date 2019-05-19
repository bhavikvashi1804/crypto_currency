import 'dart:async';
import 'dart:convert';

class Crypto
{
  String name,price_usd,percent_change_1h;
  Crypto(this.name,this.price_usd,this.percent_change_1h);
  Crypto.fromMap( Map<String,dynamic> map ):name=map['name'],price_usd=map['price_usd'],percent_change_1h=map['percent_change_1h'];
}

//abstract class which will use to fetch the data
abstract class CryptoRepo
{
  Future< List<Crypto> > fetchCurrencies();
}

//in fetching list if there some error then we need display exception so create exception
class FetchDataException implements Exception
{
  final _message;
  FetchDataException(this._message);
  String toString()
  {
    if(_message!=null)
      return "Exception: $_message";
  }
}