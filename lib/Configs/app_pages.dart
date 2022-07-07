import 'package:get/get.dart';
import 'package:products_task/Bindings/home_binding.dart';
import 'package:products_task/Pages/home.dart';

// Pages and Route manager
// We can add more pages as required
// Each page has its binding to LazyLoad the GetXControllers
class AppPages {
  static const initial = '/home';
  static const homePage = '/home';
  static final appPages = [
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
