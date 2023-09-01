import 'package:bhagvad_gita_copy/screen/detail_screen.dart';
import 'package:bhagvad_gita_copy/screen/home_screen.dart';
import 'package:bhagvad_gita_copy/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => Splashscreen(),
          'home':(context) => Homescreen(),
          'detail':(context) => Detailscreen(),
        },
      ),
    ),
  );
}