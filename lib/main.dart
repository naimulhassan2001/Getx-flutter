import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_flutter/pages/home_page.dart';
import 'package:get_x_flutter/pages/next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/next_page', page: () => NextPage()),
      ],
      home: const HomePage(),
    );
  }
}
