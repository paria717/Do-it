import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant/colors.dart';
import 'package:todo/extensions/space_xy_extension.dart';

import '../controller/login_controller.dart';
import '../controller/signup_controller.dart';

// ignore: must_be_immutable
class WellcomePage extends StatefulWidget {
  WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  SignUpController signUpController = Get.put(SignUpController());

  LoginController loginController = Get.put(LoginController());

  // TextEditingController usernameController = TextEditingController();
  var islogin = false.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: AppColors.backgroungcolors,
            child: Obx(
              () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'خوش آمدید',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                    20.0.spaceY,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            islogin.value = false;
                          },
                          child: Text('ثبت نام'),
                          color: !islogin.value
                              ? AppColors.appbarcolor
                              : Colors.white,
                        ),
                        MaterialButton(
                          onPressed: () {
                            islogin.value = true;
                          },
                          child: Text('ورود'),
                          color: islogin.value
                              ? AppColors.appbarcolor
                              : Colors.white,
                        ),
                      ],
                    ),
                    10.0.spaceY,
                    islogin.value ? LoginWidget() : SingUpWidget(),
                  ]),
            ),
          ),
        )),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  SignUpController signUpController = Get.find<SignUpController>();

  LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text_TextField_WellcomePage(
          controller: loginController.emailController,
          text: ':ایمیل',
        ),
        10.0.spaceY,
        Text_TextField_WellcomePage(
          controller: loginController.passwordController,
          text: ':کلمه عبور ',
        ),
        10.0.spaceY,
        MyButton_WellcomePage(
            onPressed: () {
              loginController.loginwithEmail();
              print(loginController.loginwithEmail());
            },
            text: 'ورود'),
        MyButton_WellcomePage(
            onPressed: () {
              Get.toNamed('/TasksPage');
            },
            text: 'ورود'),
      ],
    );
  }
}

class Text_TextField_WellcomePage extends StatelessWidget {
  final String text;

  final TextEditingController controller;
  Text_TextField_WellcomePage({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: Get.height / 30,
        width: Get.width / 1.5,
        child: Text(
          text,
          textAlign: TextAlign.end,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        width: Get.width / 1.5,
        height: Get.height / 14,
        child: TextField(
            controller: controller,
            maxLines: 1,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            )),
      ),
    ]);
  }
}

// ignore: camel_case_types, must_be_immutable
class MyButton_WellcomePage extends StatelessWidget {
  MyButton_WellcomePage(
      {super.key, required this.onPressed, required this.text});
  String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(Get.width / 3.8, Get.height / 18),
          backgroundColor: AppColors.appbarcolor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }
}

class SingUpWidget extends StatefulWidget {
  const SingUpWidget({
    super.key,
  });

  @override
  State<SingUpWidget> createState() => _SingUpWidgetState();
}

SignUpController signUpController = Get.find<SignUpController>();

LoginController loginController = Get.find<LoginController>();

class _SingUpWidgetState extends State<SingUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text_TextField_WellcomePage(
          text: ': نام کاربری', controller: signUpController.nameController),
      10.0.spaceY,
      Text_TextField_WellcomePage(
          text: ': ایمیل', controller: signUpController.emailController),
      10.0.spaceY,
      Text_TextField_WellcomePage(
          text: ': رمز عبور', controller: signUpController.passwordController),
      10.0.spaceY,
      MyButton_WellcomePage(
          onPressed: () => signUpController.SignupwithEmail(),

          // if (signUpController.emailAddressController.text.isEmpty) {
          //   print('email empty');
          // } else {
          //   signUpController.signUpWithEmail(
          //       signUpController.emailAddressController.text);

          // }

          text: 'ثبت نام'),
    ]);
  }
}
