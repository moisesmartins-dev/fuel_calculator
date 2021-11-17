import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  TextEditingController distanciaController = TextEditingController();
  TextEditingController consumoController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController pessoasController = TextEditingController();

  RxInt valueGroup = 2.obs;
  RxString? valorTotal = "0".obs;
  RxString? valorTotalPessoa = "0".obs;

  void onClickRadioButton(value) {
    valueGroup.value = value;
    update();
  }

  limparValores() {
    distanciaController.clear();
    consumoController.clear();
    quantidadeController.clear();
    precoController.clear();
    pessoasController.clear();
    valorTotal?.value = "0";
    valorTotalPessoa?.value = "0";
    valueGroup.value = 2;
  }

  calculoCombustivel() {
    double quantidade = double.parse(calculoQuantidade());
    String precoOld = precoController.text.replaceFirst(",", ".");
    double precoNew = double.parse(precoOld);
    double precoTotal;
    precoTotal = quantidade * precoNew;
    print(precoTotal.toStringAsFixed(2));
    return precoTotal.toStringAsFixed(2);
  }

  calculoCombustivelPorPessoa() {
    double precoTotal = double.parse(calculoCombustivel());
    int pessoas = int.parse(pessoasController.text);
    precoTotal = precoTotal / pessoas;
    print(precoTotal.toStringAsFixed(2));
    return precoTotal.toStringAsFixed(2);
  }

  calculoQuantidade() {
    double distancia = double.parse(distanciaController.text);
    double consumo = double.parse(consumoController.text);
    double quantidade;
    quantidade = distancia / consumo;
    return quantidade.toStringAsFixed(2);
  }
}
