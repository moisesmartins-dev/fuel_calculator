import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt valueGroup = 2.obs;

  void onClickRadioButton(value) {
    valueGroup.value = value;
    update();
  }

}
