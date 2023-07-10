import 'package:get/get.dart';
import 'package:todo/pages/tasks_page.dart';
import 'package:todo/pages/wellcome.dart';

class Routes {
  static List<GetPage> get Pages => [
        GetPage(
          name: '/TasksPage',
          page: () => const TasksPage(),
        ),
        GetPage(
          name: '/WellcomePage',
          page: () => WellcomePage(),
        )
      ];
}
