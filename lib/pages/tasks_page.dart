import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constant/colors.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 1,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: Stack(children: [
          Container(
            width: Get.width,
            height: Get.height / 4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
              color: AppColors.appbarcolor,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  )),
              SizedBox(height: Get.height / 20),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Think How To',
                      style: GoogleFonts.dancingScript(
                          fontSize: 30, color: Colors.white),
                      children: [
                        TextSpan(
                            text: ' Do it',
                            style: GoogleFonts.dancingScript(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: const Color.fromARGB(255, 84, 24, 189))),
                      ]),
                ),
              )
            ]),
          ),
          Container(
            color: AppColors.backgroungcolors,
            height: Get.height,
            width: Get.width,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Card();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
