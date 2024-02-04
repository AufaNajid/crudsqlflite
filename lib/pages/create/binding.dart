
import 'package:get/get.dart';
import 'package:local_database/pages/create/controller.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateController());
  }
}