import 'dart:convert';

MarketModel marketModelFromJson(String str) => MarketModel.fromJson(json.decode(str));

String marketModelToJson(MarketModel data) => json.encode(data.toJson());

class MarketModel {
  MarketModel({
    this.activeSymbols,
    this.echoReq,
    this.msgType,
  });

  List<ActiveSymbol>? activeSymbols;
  EchoReq? echoReq;
  String? msgType;

  factory MarketModel.fromJson(Map<String, dynamic> json) => MarketModel(
        activeSymbols: List<ActiveSymbol>.from(json["active_symbols"].map((x) => ActiveSymbol.fromJson(x))),
        echoReq: EchoReq.fromJson(json["echo_req"]),
        msgType: json["msg_type"],
      );

  Map<String, dynamic> toJson() => {
        "active_symbols": List<dynamic>.from(activeSymbols!.map((x) => x.toJson())),
        "echo_req": echoReq?.toJson(),
        "msg_type": msgType,
      };
}

class ActiveSymbol {
  ActiveSymbol({
    this.allowForwardStarting,
    this.displayName,
    this.exchangeIsOpen,
    this.isTradingSuspended,
    this.market,
    this.marketDisplayName,
    this.pip,
    this.submarket,
    this.submarketDisplayName,
    this.symbol,
    this.symbolType,
  });

  int? allowForwardStarting;
  String? displayName;
  int? exchangeIsOpen;
  int? isTradingSuspended;
  String? market;
  String? marketDisplayName;
  double? pip;
  String? submarket;
  String? submarketDisplayName;
  String? symbol;
  String? symbolType;

  factory ActiveSymbol.fromJson(Map<String, dynamic> json) => ActiveSymbol(
        allowForwardStarting: json["allow_forward_starting"],
        displayName: json["display_name"],
        exchangeIsOpen: json["exchange_is_open"],
        isTradingSuspended: json["is_trading_suspended"],
        market: json["market"],
        marketDisplayName: json["market_display_name"],
        pip: json["pip"].toDouble(),
        submarket: json["submarket"],
        submarketDisplayName: json["submarket_display_name"],
        symbol: json["symbol"],
        symbolType: json["symbol_type"],
      );

  Map<String, dynamic> toJson() => {
        "allow_forward_starting": allowForwardStarting,
        "display_name": displayName,
        "exchange_is_open": exchangeIsOpen,
        "is_trading_suspended": isTradingSuspended,
        "market": market,
        "market_display_name": marketDisplayName,
        "pip": pip,
        "submarket": submarket,
        "submarket_display_name": submarketDisplayName,
        "symbol": symbol,
        "symbol_type": symbolType,
      };
}

class EchoReq {
  EchoReq({
    this.activeSymbols,
    this.productType,
  });

  String? activeSymbols;
  String? productType;

  factory EchoReq.fromJson(Map<String, dynamic> json) => EchoReq(
        activeSymbols: json["active_symbols"],
        productType: json["product_type"],
      );

  Map<String, dynamic> toJson() => {
        "active_symbols": activeSymbols,
        "product_type": productType,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
