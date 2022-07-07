import 'package:flutter/material.dart';
import 'package:products_task/Configs/app_strings.dart';
import 'package:products_task/Models/market_model.dart';
import 'package:products_task/Models/tick_model.dart';
import 'package:products_task/Network/web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PriceSocketManager {
  WebSocketChannel? channel = AppSocket.instance.channel;

  // Get current market and symbols
  getSymbols(String message) {
    addSink(message);
  }

  // Get symbol tick information
  getSymbolTick(ActiveSymbol symbol) {
    if (symbol.symbol == null) return;
    addSink(AppStrings.tickSymbol.replaceFirst("R_50", (symbol.symbol)!));
  }

  // Forget current symbol before calling a new symbol tick
  forgetSymbol(TickModel tick) {
    var forget = AppStrings.forgetTickData.replaceFirst('tick_id', (tick.tick?.id ?? ''));
    debugPrint(forget);
    addSink(forget);
  }

  addSink(String message) {
    channel?.sink.add(message);
  }
}
