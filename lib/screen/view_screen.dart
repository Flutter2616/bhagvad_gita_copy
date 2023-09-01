import 'package:bhagvad_gita_copy/controller/gita_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Viewscreen extends StatefulWidget {
  const Viewscreen({super.key});

  @override
  State<Viewscreen> createState() => _ViewscreenState();
}

class _ViewscreenState extends State<Viewscreen> {
  Gitacontroller controller = Get.put(Gitacontroller());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: controller.sloklist.isEmpty
                ? Center(
              child: CircularProgressIndicator(color: Colors.amber.shade700,
                  backgroundColor: Colors.grey.shade200),
            )
                : SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Text("꧁श्लोक꧂",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  Obx(() =>
                      Text(
                        "${controller.sloklist[controller.pageindex.value]
                            .text}",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )),
                  const SizedBox(height: 20),
                  Text("꧁टिप्पणी꧂",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  Obx(() =>
                      Text(
                        textAlign: TextAlign.justify,
                        "${controller.sloklist[controller.pageindex.value]
                            .wordMeanings}",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )),
                  const SizedBox(height: 20),
                  Text("꧁अनुवाद꧂",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller
                        .sloklist[controller.pageindex.value].commentaries!
                        .asMap()
                        .entries
                        .map(
                          (e) =>
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                  textAlign: TextAlign.justify,
                                  "${controller.sloklist[controller.pageindex
                                      .value].commentaries![e.key]
                                      .description}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.sp)),
                              const SizedBox(height: 5),
                              Text(
                                  textAlign: TextAlign.justify,
                                  "${controller.sloklist[controller.pageindex
                                      .value].commentaries![e.key].authorName}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp)),
                              const SizedBox(height: 10),
                              Divider(
                                  color: Colors.grey.shade300,
                                  height: 1,
                                  thickness: 2),
                            ],
                          ),
                    )
                        .toList(),
                  )
                ],
              ),
            ),
          ),
    );
  }
}
