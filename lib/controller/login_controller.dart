import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/api/url.dart';
import 'package:todo/pages/tasks_page.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginwithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiUrl.apilist.loginEmail);
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 1) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;

          emailController.clear();
          passwordController.clear();
          Get.off(const TasksPage());
        } else {
          throw jsonDecode(response.body)['message'];
        }
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Error3'),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}
