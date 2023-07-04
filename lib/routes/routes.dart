import 'package:get/get.dart';
import 'package:todo/pages/tasks_page.dart';

class Routes {
  static List<GetPage> get Pages => [
        GetPage(
          name: '/TasksPage',
          page: () => const TasksPage(),
        ),
      ];
}
