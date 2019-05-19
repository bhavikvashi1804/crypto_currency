import 'package:cryptocurrency_app/data/cyrpto_data.dart';
import 'package:cryptocurrency_app/dependency_injection.dart';
abstract class CryptoListViewContract
{
  void onLoadCryptoComplete(List<Crypto> items); //completed
  void onLoadCryptoError(); //error occured
}

class CryptoListPresenter
{
  CryptoListViewContract _view;
  CryptoRepo _repository;

  CryptoListPresenter(this._view)
  {
    _repository=new Injector().cryptoRepository;
  }

  void loadCurrencies() {
    _repository
        .fetchCurrencies()
        .then((c) => _view.onLoadCryptoComplete(c))
        .catchError((onError) => _view.onLoadCryptoError());
  }
}