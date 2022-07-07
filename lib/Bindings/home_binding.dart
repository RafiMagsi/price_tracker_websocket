import 'package:get/get.dart';
import 'package:products_task/Controllers/home_controller.dart';

// Home binding to initialize all the required controllers at once before using
class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
