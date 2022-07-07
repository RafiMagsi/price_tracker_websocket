import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Configs/app_strings.dart';
import 'package:products_task/Configs/text_styles.dart';
import 'package:products_task/Controllers/home_controller.dart';
import 'package:products_task/Network/price_socket_manager.dart';
import 'package:products_task/Widgets/Templates/page_template.dart';
import 'package:products_task/Widgets/market_drop_down.dart';
import 'package:products_task/Widgets/symbol_drop_down.dart';

// Home page
// Page template
class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await controller.connect();
    });
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "Price tracker",
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
        child: Column(
          children: [
            StreamBuilder(
              // Stream builder to handle the in-coming response
              stream: controller.streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
                    debugPrint(snapshot.data.toString());
                    var response = json.decode(snapshot.data.toString());
                    // If received the Active symbols data
                    if (response[AppStrings.msgType] == AppStrings.activeSymbolsCall) {
                      controller.readMarkets(snapshot.data.toString());
                    }
                    // If received the symbol tick data
                    if (response[AppStrings.msgType] == AppStrings.tickCall) {
                      controller.readTick(snapshot.data.toString());
                    }
                    // If received the forget symbol data
                    if (response[AppStrings.msgType] == AppStrings.forgetSymbol) {
                      PriceSocketManager().getSymbolTick(controller.currentSymbol.value);
                    }
                  });
                }
                return Text(
                  // Shows if the data has been received from socket or loading the data
                  snapshot.hasData ? 'Data Received' : 'Loading',
                );
              },
            ),
            const SizedBox(height: AppSizes.largeSpacing),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => MarketDropDown(
                      // Market picker
                      items: controller.marketFilteredList,
                      title: 'Select Market',
                      selectedValue: controller.selectedMarket,
                      notifier: controller.selectedMarket.value,
                      onChange: (market) {
                        controller.forgetSymbol();
                        controller.updateSymbols(market);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.largeSpacing),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => SymbolDropDown(
                      // Symbol picker
                      items: controller.symbolList.value,
                      title: 'Select Symbol',
                      selectedValue: controller.selectedSymbol,
                      notifier: controller.selectedSymbol.value,
                      onChange: (symbol) {
                        if (controller.currentSymbol.value.symbol != null) {
                          controller.forgetSymbol();
                        } else {
                          PriceSocketManager().getSymbolTick(symbol);
                        }
                        controller.currentSymbol.value = symbol;
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.xLargeSpacing),
            Row(
              children: [
                Expanded(
                  child: Obx(
                    () => Text(
                      // Shows selected symbol tick quote value
                      (controller.tickQuote.value).toString(),
                      style: AppStyles.priceStyle(color: controller.tickQuoteColor.value),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      rootPage: true,
    );
  }
}
