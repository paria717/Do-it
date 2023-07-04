import 'package:get/get.dart';
import 'package:todo/model/task.dart';

class TasksController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;
}
