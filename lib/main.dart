import "package:anime_db/home/controller/home_binding.dart";
import 'package:anime_db/routing/route_pages.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "ANIME DB",
      getPages: RoutePages.pages,
      initialBinding: HomeBinding(),
      initialRoute: "/",
    );
  }
}


// konay@gmail.com 
// 123456 
