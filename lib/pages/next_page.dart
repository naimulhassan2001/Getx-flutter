

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  NextPage({super.key }) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.arguments[0]} ${Get.arguments[1]}' )
      ),
      body: const Center(child: Text('this is next page')),
    );
  }
}
