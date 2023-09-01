import 'package:bhagvad_gita_copy/screen/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/gita_controller.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  Gitacontroller controller = Get.put(Gitacontroller());
  Map m1 = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => DefaultTabController(
        length: controller.sloklist.length,
        child: Scaffold(
          appBar: AppBar(
              bottom: TabBar(
                onTap: (value) {
                  controller.pageindex.value = value;
                },
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                padding: EdgeInsets.only(bottom: 5),
                indicatorColor: Colors.white,
                tabs: controller.sloklist
                    .asMap()
                    .entries
                    .map((e) => Tab(
                  height: 3.h,
                  child: Text(
                      "श्लोक ${controller.sloklist[e.key].verseNumber}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500)),
                ))
                    .toList(),
              ),
              title: Text("${m1['modal'].name}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.white)),
              backgroundColor: Colors.amber.shade700,
              elevation: 0),
          body: TabBarView(physics: NeverScrollableScrollPhysics(),
            children: controller.sloklist
                .asMap()
                .entries
                .map((e) => Viewscreen())
                .toList(),
          ),
        ),
      ),
    );
  }
}

//Text("Summary",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15.sp,
//                     color: Colors.black)),
//             const SizedBox(height: 10),
