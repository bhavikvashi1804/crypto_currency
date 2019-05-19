import 'package:cryptocurrency_app/data/cyrpto_data.dart';
import 'package:cryptocurrency_app/data/crypto_data_dummy.dart';
import 'package:cryptocurrency_app/data/crypto_data_produce.dart';


//it to use to swap mock data and produce data



enum Flavor { Dummy , Produced }


//make depedency injection
class Injector
{
  static final Injector _singleton=new Injector._internal();
  //here we use singleton because we need only one instance
  //if class box has l,b,h ;from this property we can make many boxes
  //for only one instant use _singleton ( prime / simple)


  static Flavor _flavor;
  static void configure(Flavor f)
  {
    _flavor=f;
  }

  factory Injector()
  {
    return _singleton;
  }


  Injector._internal();

  CryptoRepo get cryptoRepository
  {
    switch(_flavor)
    {
      case Flavor.Dummy:return new MockCryptoRepo();
      default:return new ProduceCrypto();
    }
  }

}

