import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:products_task/Configs/app_pages.dart';
import 'package:products_task/Helpers/app_theme.dart';
import 'package:products_task/Helpers/utils.dart';

Future<void> main() async {
  // Initializing Get Storage
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Added for Un-Focus fields and hiding keyboard
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Utils.unFocus(context);
      },
      child: GetMaterialApp(
        theme: AppTheme.lightTheme(), // Light theme
        darkTheme: AppTheme.darkTheme(), //Dart theme
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initial, // Start page of the app
        getPages: AppPages.appPages, // List of pages for Navigation
        navigatorObservers: <RouteObserver<ModalRoute<void>>>[routeObserver], // Route observer
      ),
    );
  }
}

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
