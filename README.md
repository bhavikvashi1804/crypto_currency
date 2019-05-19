# cryptocurrency_app
A new Flutter project.

## Getting Started

1.data folder :-
    -In data folder there are 3 files
    1.crypto_data it contains
        ->1.class for one currency object. : Crypto
        ->2.abstract class to store the obtain currency object list : CryptoRepo method fetchCurrencies
        ->3.exception class to make custom exception : FetchDataException
    2.crypto_data_dummy
        ->it generates the dummy data for testing purpose
        ->it implements CryptoRepo class.
        ->hence it override the fetchCurrencies which build dummy data  and return it.
    3.crypto_data_produce
        ->it generates the actual data
        ->it implements CryptoRepo class.
        ->hence it override the fetchCurrencies which generates list of currences from API and return it.

2.modules folder :-
    -it contains only file
    1.crypto_present
        ->it contains two class 1.class CryptoListPresenter
                                2.abstract class CryptoListViewContract
        1.CryptoListViewContact
            ->it contains two abstract method
                void onLoadCryptoComplete(List<Crypto> items); //what to do if data loading is completed
                void onLoadCryptoError(); //what to do if data loading is fail.
        2.CryptoListPresenter
            ->it contains object of CryptoRepo abstract class of crypto_data & CryptoListViewContact
            ->in constructor using Injection class method it specifies fetchCurrencies of which method is to be call
                -_repository=new Injector().cryptoRepository;
                -_repository is object of CryptoRepo & _repository=new Injector().cryptoRepository; which method to be return
                -means for CryptoRepo class method fetchCurrencies()=MockCryptoRepo() or ProduceCrypto()
            ->it contains one method loadCurrencies which calls _repository.fetchCurrency method and class onLoadComplete
3.lib :-
    - it contains 3 files
    1.main.dart
        -> it just provides structure of app
        ->Injector.configure(Flavor.Produced); // specifies flavor means Produce flavor is selected and fetchCurrencies()=ProduceCrypto()
    2.home_page.dart
        ->it contains full body
        ->it creates  object of CryptoListPresenter and calls loadCurrency method to fetch data
        ->it implements abstract class CryptoListViewContract
            -implements onLoadCryptoComplete & onLoadCryptoError method
    3.dependency_injection.dart
        ->it specify which flavor is choose
        ->at which flavor which method should be return