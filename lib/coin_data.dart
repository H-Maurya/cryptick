import 'dart:convert';
import 'package:http/http.dart' as http;
import 'price_screen.dart';

const url = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '4F7753DC-3207-4982-B617-F1ECA116071B';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData1() async {
    String reqURL = '$url/BTC/$startingCurrency?apikey=$apiKey';
    var u = Uri.parse(reqURL);
    http.Response response = await http.get(u);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
    }
  }

  Future getCoinData2() async {
    String reqURL = '$url/ETH/$startingCurrency?apikey=$apiKey';
    var u = Uri.parse(reqURL);
    http.Response response = await http.get(u);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
    }
  }

  Future getCoinData3() async {
    String reqURL = '$url/LTC/$startingCurrency?apikey=$apiKey';
    var u = Uri.parse(reqURL);
    http.Response response = await http.get(u);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
    }
  }
}
