import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_task/Configs/app_strings.dart';
import 'package:products_task/Models/filtered_market.dart';
import 'package:products_task/Models/market_model.dart';
import 'package:products_task/Helpers/extensions.dart';
import 'package:products_task/Models/tick_model.dart';
import 'package:products_task/Network/price_socket_manager.dart';
import 'package:products_task/Network/web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeController extends GetxController {
  // Market and symbols objects
  var marketList = MarketModel().obs;
  var symbolList = RxList<ActiveSymbol>();
  var marketFilteredList = RxList<FilteredMarket>();

  // Tick objects
  var tickQuote = 0.0.obs;
  var tickQuoteColor = Colors.grey.obs;

  // Selected or current objects
  var selectedMarket = FilteredMarket().obs;
  var selectedSymbol = ActiveSymbol().obs;
  var currentTick = TickModel().obs;
  var currentSymbol = ActiveSymbol().obs;

  WebSocketChannel? channel;

  // Stream controller for handling in-coming socket data
  final streamController = StreamController.broadcast();

  // Connect will gets the Socket singleton from AppSocket
  // We need a stream controller to manager socket data
  // We will get current market/symbols
  Future<void> connect() async {
    channel = AppSocket.instance.channel;
    streamController.addStream((channel?.stream)!);
    PriceSocketManager().getSymbols(AppStrings.activeSymbolsData);
  }

  // Markets and Symbols data is filtered and separated as required
  Future<void> readMarkets(String response) async {
    marketList.value = marketModelFromJson(response);

    // Groups the data by Market and its symbols
    final releaseDateMap = marketList.value.activeSymbols?.groupBy((m) => m.marketDisplayName);

    marketFilteredList.value =
        (releaseDateMap?.entries.map((entry) => FilteredMarket(market: entry.key, symbols: entry.value)).toList())!;

    // For default picker value
    marketFilteredList.insert(0, FilteredMarket(market: 'Select Market'));
    selectedMarket.value = marketFilteredList.first;
  }

  // Will read the in-coming ticks data of selected symbol
  // Updates the Symbol price and color according to price change
  Future<void> readTick(String response) async {
    currentTick.value = tickModelFromJson(response);
    tickQuoteColor.value = (currentTick.value.tick?.quote)! == tickQuote.value
        ? Colors.grey
        : (currentTick.value.tick?.quote)! > tickQuote.value
            ? Colors.green
            : Colors.red;
    tickQuote.value = (currentTick.value.tick?.quote) ?? 0.0;
  }

  // When market is changed the symbols will be updated
  void updateSymbols(FilteredMarket market) {
    symbolList.value = (market.symbols?.where((element) => element.symbol != '').toList()) ?? [];
    symbolList.insert(0, ActiveSymbol(symbol: 'Select Symbol'));
    selectedSymbol.value = symbolList.first;
  }

  // Reset symbol related objects and data
  // Send message to socket to forget the current symbol ticks
  void forgetSymbol() {
    if (currentSymbol.value.symbol == null) return;
    PriceSocketManager().forgetSymbol(currentTick.value);
    currentSymbol.value.symbol = null;
    tickQuote.value = 0.0;
    tickQuoteColor.value = Colors.grey;
  }
}
