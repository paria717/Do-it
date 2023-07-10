import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/binding/binding.dart';
import 'package:todo/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      getPages: Routes.Pages,
      initialBinding: Binding(),
      initialRoute: '/WellcomePage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
