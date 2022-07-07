import 'package:products_task/Models/market_model.dart';

// Custom class for managing filtered market/symbol objects
class FilteredMarket {
  FilteredMarket({
    this.symbols,
    this.market,
  });

  List<ActiveSymbol>? symbols;
  String? market;
}
