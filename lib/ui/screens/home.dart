import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fuel_calculator/controller/home_controller.dart';
import 'package:fuel_calculator/ui/widget/radio_button.dart';
import 'package:fuel_calculator/ui/widget/text_field.dart';
import 'package:fuel_calculator/ui/widget/text_field_money.dart';
import 'package:fuel_calculator/ui/widget/texto.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: SizerUtil.deviceType == DeviceType.mobile
                ? Size.fromHeight(7.h) // Widget for Mobile
                : Size.fromHeight(7.h),
            // Widget for Tablet

            child: AppBar(
              title: Texto(
                text: "Calculadora de Combustível",
                txtSize: 15,
                fontWeight: FontWeight.w400,
              ),
              actions: [
                IconButton(
                  onPressed: () => _homeController.limparValores(),
                  icon: Icon(
                    FontAwesomeIcons.undoAlt,
                    color: Colors.black,
                  ),
                )
              ],
              centerTitle: true,
              backgroundColor: Colors.amber,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
          ),
          backgroundColor: Colors.amberAccent,
          body: SafeArea(
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 25),
                            child: Texto(
                              text: "Dados iniciais",
                              txtSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.route),
                              SizedBox(
                                width: 5.w,
                              ),
                              Texto(
                                text: "Distância",
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                              )
                            ],
                          ),
                          TextFieldCustom(
                            textEditingController:
                                _homeController.distanciaController,
                            labelTxt: "Quilômetro (km)",
                            width: 17,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.tachometerAlt),
                              SizedBox(
                                width: 5.w,
                              ),
                              Texto(
                                text: SizerUtil.deviceType == DeviceType.mobile
                                    ? "Cons. de combustível"
                                    : "Consumo de combustível",
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                          TextFieldCustom(
                            textEditingController:
                                _homeController.consumoController,
                            labelTxt: "km/litro",
                            width: 14,
                            valueChanged: (value) {
                              _homeController.quantidadeController.text =
                                  _homeController.calculoQuantidade();
                              print(_homeController.quantidadeController.text);
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.gasPump),
                              SizedBox(
                                width: 5.w,
                              ),
                              Texto(
                                text: SizerUtil.deviceType == DeviceType.mobile
                                    ? "Qtd de combustível"
                                    : "Quantidade de combustível",
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                              )
                            ],
                          ),
                          TextFieldCustom(
                            // txtValue: _homeController.calculoQuantidade(),
                            textEditingController:
                                _homeController.quantidadeController,
                            labelTxt: "litros*",
                            width: 14,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.coins),
                              SizedBox(
                                width: 5.w,
                              ),
                              Texto(
                                text: "Preço do combustível",
                                txtSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                          TextFieldMoneyCustom(
                            textEditingController:
                                _homeController.precoController,
                            prefixTxt: "R\$ ",
                            labelTxt: "Reais",
                            width: 14,
                            valueChanged: (value) {
                              if (_homeController
                                  .precoController.text.isEmpty) {
                                print('foi');
                                _homeController.valorTotal?.value = "0";
                                _homeController.valorTotalPessoa?.value = "0";
                              }
                              _homeController.valorTotal?.value =
                                  _homeController.calculoCombustivel();
                              if (_homeController.valueGroup.value == 1) {
                                _homeController.valorTotalPessoa?.value =
                                    _homeController
                                        .calculoCombustivelPorPessoa();
                              }
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Texto(
                                  text: "Vai dividir o valor total entre"
                                      " amigos?",
                                  txtSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RadioButton(value: 1, valuegroup: 1),
                                Texto(
                                  text: "Sim",
                                  txtSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                RadioButton(value: 2, valuegroup: 2),
                                Texto(
                                  text: "Não",
                                  txtSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Obx(
                                  () {
                                    return AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      opacity:
                                          _homeController.valueGroup.value == 2
                                              ? 0.0
                                              : 1.0,
                                      child: TextFieldCustom(
                                        textEditingController:
                                            _homeController.pessoasController,
                                        labelTxt: "Pessoas",
                                        width: 10,
                                        valueChanged: (value) {
                                          if (_homeController
                                              .precoController.text.isEmpty) {
                                            _homeController
                                                .valorTotalPessoa?.value = "0";
                                          }
                                          _homeController
                                                  .valorTotalPessoa?.value =
                                              _homeController
                                                  .calculoCombustivelPorPessoa();
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Texto(
                            text: "Resultado",
                            txtSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: 90.w,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Texto(
                                  text: "Valor total",
                                  txtSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                Container(
                                  child: Center(
                                    child: Obx(
                                      () {
                                        return Texto(
                                          text: "R\$ "
                                              "${_homeController.valorTotal}",
                                          txtSize: 14,
                                          fontWeight: FontWeight.normal,
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Obx(
                              () {
                                return AnimatedOpacity(
                                  //TODO implementar logica {se value for igual 1(sim) fica visivel }
                                  duration: const Duration(milliseconds: 300),
                                  opacity: _homeController.valueGroup.value == 2
                                      ? 0.0
                                      : 1.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Texto(
                                        text: "Valor dividido para cada "
                                            "amigo",
                                        txtSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      Container(
                                        child: Center(
                                          child: Obx(
                                            () {
                                              return Texto(
                                                text:
                                                    "R\$ ${_homeController.valorTotalPessoa}",
                                                txtSize: 14,
                                                fontWeight: FontWeight.normal,
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                        ),
                        child: Texto(
                          text: "Compartilhar",
                          txtSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
