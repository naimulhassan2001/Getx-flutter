import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_flutter/controller/counter_controller.dart';
import 'package:get_x_flutter/controller/image_picker_controller.dart';
import 'package:get_x_flutter/pages/log_in_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {


    final CounterCountroller counterController = CounterCountroller() ;
    final ImagePickerController imagePickerController = Get.put(ImagePickerController()) ;


    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Flutter'),
      ),
      body: Column(
        children: [
          Obx(() => GestureDetector(
            onTap: () {
              imagePickerController.getImage() ;
            },
            child: CircleAvatar(
              radius: 40,
              backgroundImage: imagePickerController.imagePath.isNotEmpty ?
              FileImage(File(imagePickerController.imagePath.toString())) : null ,

            ),
          )),
          TextButton(onPressed: (){
            imagePickerController.getImage() ;
          }, child: const Text('get Image')),
          Card(
            child: ListTile(
              title: const Text('Gets Dialog'),
              subtitle: const Text('this is get Dialog box'),
              onTap: (){
                Get.defaultDialog(
                  title:'Get Dialog Box',
                  middleText: 'this getX dialog box',
                  confirm: TextButton(
                      onPressed: (){
                        Navigator.pop(context) ;
                      },
                      child: const Text('ok')),
                  cancel: TextButton(
                      onPressed: (){
                        Get.back() ;
                        },
                      child: const Text('Cancel')),
                  titlePadding: const EdgeInsets.only(top: 20)


                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Gets BottomSheet'),
              subtitle: const Text('this is get Dialog box'),
              onTap: (){
                Get.bottomSheet(
                  backgroundColor: Colors.blue,
                 Container(
                   child: Column(
                     children: [
                       ListTile(
                         onTap: (){
                           Get.changeTheme(ThemeData.light());
                         },
                         leading: const Icon(Icons.light_mode),
                         title: const Text('Light theme'),
                       ),
                       ListTile(
                         leading: const Icon(Icons.dark_mode),
                         title: const Text('dark theme'),
                         onTap: () {
                           Get.changeTheme(ThemeData.dark());
                         },
                       ),
                     ],
                   ),
                 )

                );
              },
            ),
          ),
          const SizedBox(height: 10,),
          Card(
            color: Colors.blueAccent,
            child: TextButton(
                onPressed: (){
                  Get.to(LogIn()) ;

                },
                child: const Text('Next page', style: TextStyle(color: Colors.black),)),
          ),
          const SizedBox(height: 10,),
          Card(
            color: Colors.blueAccent,
            child: TextButton(

                onPressed: (){
                  Get.snackbar('Snackbar', 'this is snackbar',
                      colorText: Colors.white,
                      backgroundColor: Colors.blue,
                      snackPosition: SnackPosition.TOP
                  );
                  },
                child: const Text('Snackbar', style: TextStyle(color: Colors.black),)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Obx(() => Text(counterController.counter.toString()))
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment() ;
        },
        child: const Icon((Icons.add)),
      ),
    );
  }
}
