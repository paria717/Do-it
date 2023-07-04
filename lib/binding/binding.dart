import 'package:get/get.dart';
import 'package:todo/controller/tasks_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TasksController());
  }
}
