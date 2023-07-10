import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/constant/colors.dart';
import 'package:todo/extensions/space_xy_extension.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: MyFloatingActionButton(),
        body: Column(
          children: [
            MyCustomAppBar(),
            5.0.spaceY,
            MyTasksList(),
          ],
        ),
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.appbarcolor,
      onPressed: () {},
      elevation: 1,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}

class MyTasksList extends StatelessWidget {
  const MyTasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: Get.height / 1.5,
      width: Get.width,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 2,
        itemBuilder: (context, index) {
          return const Card(
            color: AppColors.cardcolors,
            elevation: 16,
            child: ListTile(
                title: Text(
                  "data",
                ),
                subtitle: Text('data')),
          );
        },
      ),
    );
  }
}

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 4,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(offset: Offset(0, 2), color: Colors.black26),
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        ),
        color: AppColors.appbarcolor,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
    );
  }
}
