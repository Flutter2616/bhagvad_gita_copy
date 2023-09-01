import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() {
      Get.offAllNamed("home");
    },);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 100.w,
          height: 100.h,alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png"),
                const SizedBox(height: 10),
                Text("श्रीमद्‍भगवद्‍गीता",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        color: Colors.amber.shade700)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
