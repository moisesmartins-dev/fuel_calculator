import 'package:flutter/material.dart';
import 'package:fuel_calculator/controller/home_controller.dart';
import 'package:get/get.dart';

class RadioButton extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());
  int value;
  int valuegroup;

  RadioButton({
    required this.value,
    required this.valuegroup,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Radio(
        activeColor: Colors.black,
        value: value,
        groupValue: _homeController.valueGroup.value,
        onChanged: (value) {
          _homeController.onClickRadioButton(value);
        },
      ),
    );
  }
}
