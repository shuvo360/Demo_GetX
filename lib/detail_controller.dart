import 'package:get/get.dart';

class DetailController extends GetxController {
  var fav = 0.obs;

  void favcounter() {
    if (fav.value == 1) {
      Get.snackbar('Loved it', 'You already loved it');
    } else {
      fav.value++;
      Get.snackbar('Loved it', 'You just loved it');
    }
  }
}
