import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';

String startingCurrency = 'USD';

class PriceScreen extends StatefulWidget {
  PriceScreen({this.price});
  final price;
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  DropdownButton<String> androidDropDownButton() {
    return DropdownButton<String>(
      value: startingCurrency,
      items: [
        DropdownMenuItem(child: Text('AUD'), value: 'AUD'),
        DropdownMenuItem(child: Text('BRL'), value: 'BRL'),
        DropdownMenuItem(child: Text('CAD'), value: 'CAD'),
        DropdownMenuItem(child: Text('CNY'), value: 'CNY'),
        DropdownMenuItem(child: Text('EUR'), value: 'EUR'),
        DropdownMenuItem(child: Text('GBP'), value: 'GBP'),
        DropdownMenuItem(child: Text('HKD'), value: 'HKD'),
        DropdownMenuItem(child: Text('IDR'), value: 'IDR'),
        DropdownMenuItem(child: Text('ILS'), value: 'ILS'),
        DropdownMenuItem(child: Text('INR'), value: 'INR'),
        DropdownMenuItem(child: Text('JPY'), value: 'JPY'),
        DropdownMenuItem(child: Text('MXN'), value: 'MXN'),
        DropdownMenuItem(child: Text('NOK'), value: 'NOK'),
        DropdownMenuItem(child: Text('NZD'), value: 'NZD'),
        DropdownMenuItem(child: Text('PLN'), value: 'PLN'),
        DropdownMenuItem(child: Text('RON'), value: 'RON'),
        DropdownMenuItem(child: Text('RUB'), value: 'RUB'),
        DropdownMenuItem(child: Text('SEK'), value: 'SEK'),
        DropdownMenuItem(child: Text('SGD'), value: 'SGD'),
        DropdownMenuItem(child: Text('USD'), value: 'USD'),
        DropdownMenuItem(child: Text('ZAR'), value: 'ZAR'),
      ],
      onChanged: (value) {
        setState(
          () {
            startingCurrency = value;
            getData1();
            getData2();
            getData3();
          },
        );
      },
    );
  }

  CupertinoPicker iosPicker() {
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        startingCurrency = currenciesList[selectedIndex];
        getData1();
        getData2();
        getData3();
      },
      children: [
        Text('AUD'),
        Text('CAD'),
        Text('CNY'),
        Text('EUR'),
        Text('GBP'),
        Text('BRL'),
        Text('HKD'),
        Text('IDR'),
        Text('ILS'),
        Text('INR'),
        Text('JPY'),
        Text('MXN'),
        Text('NOK'),
        Text('NZD'),
        Text('PLN'),
        Text('RON'),
        Text('RUB'),
        Text('SEK'),
        Text('SGD'),
        Text('USD'),
        Text('ZAR'),
      ],
    );
  }

  String rate1 = '?';
  String rate2 = '?';
  String rate3 = '?';

  void getData1() async {
    try {
      double data = await CoinData().getCoinData1();
      setState(() {
        rate1 = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  void getData2() async {
    try {
      double data = await CoinData().getCoinData2();
      setState(() {
        rate2 = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  void getData3() async {
    try {
      double data = await CoinData().getCoinData3();
      setState(() {
        rate3 = data.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData1();
    getData2();
    getData3();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $rate1 $startingCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $rate2 $startingCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $rate3 $startingCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 390,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.lightBlue,
              ),
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              child: Platform.isIOS ? iosPicker() : androidDropDownButton(),
            ),
          ),
        ],
      ),
    );
  }
}


//