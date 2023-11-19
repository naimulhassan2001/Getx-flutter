

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerController extends GetxController{

  RxString imagePath = ''.obs ;


  onChagage(String value) {
    imagePath.value = value ;
  }


  Future getImage() async {

    var image =await ImagePicker().pickImage(source: ImageSource.camera);
    if( image != null) {
      imagePath.value = image.path.toString() ;
    }





  }




}