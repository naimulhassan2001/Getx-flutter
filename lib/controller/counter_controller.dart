


import 'package:get/get.dart';

class CounterCountroller extends GetxController {
  RxInt counter = 0.obs ;

  increment () {
    counter.value ++ ;
  }


}