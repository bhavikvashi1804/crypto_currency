import 'cyrpto_data.dart';
import 'dart:async';

class MockCryptoRepo implements CryptoRepo
{
  @override
  Future<List<Crypto>> fetchCurrencies() {
    // TODO: implement fetchCurrencies
    return Future.value(currencies);
  }
}


var currencies = <Crypto>[
  new Crypto("BitCoin", "200", "-1.1"),
  new Crypto("BitCoin1", "100", "-5.1"),
  new Crypto("BitCoin2", "50", "1.1"),
];