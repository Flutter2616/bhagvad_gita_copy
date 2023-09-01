import 'package:bhagvad_gita_copy/controller/gita_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Gitacontroller controller = Get.put(Gitacontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("श्रीमद्‍भगवद्‍गीता",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: Colors.white)),
          backgroundColor: Colors.amber.shade700,
          elevation: 0),
      body: FutureBuilder(
        future: controller.load_Adhayapi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            controller.adhaylist.value = snapshot.data!;
            return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                       controller.load_Slok(
                          "${controller.adhaylist[index].chapterNumber}");
                      Get.toNamed("detail", arguments: {
                        "modal": controller.adhaylist[index],
                        "id": "${controller.adhaylist[index].chapterNumber}"
                      });
                    },
                    trailing: Icon(Icons.arrow_forward_ios,
                        color: Colors.black, size: 12.sp),
                    leading: Text(
                        "${controller.adhaylist[index].chapterNumber}",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                    minLeadingWidth: 5.w,
                    title: Text("${controller.adhaylist[index].name}",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                  );
                },
                itemCount: controller.adhaylist.length);
          }
          return Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.grey.shade200,
                color: Colors.amber.shade700),
          );
        },
      ),
    );
  }
}
