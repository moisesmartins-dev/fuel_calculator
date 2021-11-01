import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fuel_calculator/controller/home_controller.dart';
import 'package:fuel_calculator/ui/widget/radio_button.dart';
import 'package:fuel_calculator/ui/widget/text_field.dart';
import 'package:fuel_calculator/ui/widget/text_field_money.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

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
                : Size.fromHeight(7.h), // Widget for Tablet

            child: AppBar(
              title: Text(
                "Calculadora de Combustível",
                style: GoogleFonts.amaranth(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.amber,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark),
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
                            child: Text(
                              "Dados iniciais",
                              style: GoogleFonts.amaranth(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
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
                              Text(
                                "Distância",
                                style: TextStyle(
                                  fontFamily: "Amaranth",
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
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
                              Text(
                                SizerUtil.deviceType == DeviceType.mobile
                                    ? "Cons. de combustível"
                                    : "Consumo de combustível",
                                style: TextStyle(
                                  fontFamily: "Amaranth",
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.normal,
                                ),
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
                              Text(
                                SizerUtil.deviceType == DeviceType.mobile
                                    ? "Qtd de combustível"
                                    : "Quantidade de combustível",
                                style: TextStyle(
                                  fontFamily: "Amaranth",
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
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
                              Text(
                                "Preço do combustível",
                                style: TextStyle(
                                  fontFamily: "Amaranth",
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.normal,
                                ),
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
                                Text(
                                  "Vai dividir o valor total entre amigos?",
                                  style: TextStyle(
                                    fontFamily: "Amaranth",
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.normal,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RadioButton(value: 1, valuegroup: 1),
                                Text(
                                  "Sim",
                                  style: TextStyle(
                                    fontFamily: "Amaranth",
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                RadioButton(value: 2, valuegroup: 2),
                                Text(
                                  "Não",
                                  style: TextStyle(
                                    fontFamily: "Amaranth",
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.normal,
                                  ),
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
                          Text(
                            "Resultado",
                            style: GoogleFonts.amaranth(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
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
                                Text(
                                  "Valor total",
                                  style: TextStyle(
                                    fontFamily: "Amaranth",
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Obx(() {
                                      return Text(
                                        "R\$ ${_homeController.valorTotal}",
                                        style: TextStyle(
                                          fontFamily: "Amaranth",
                                          fontSize: 14.sp,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      );
                                    }),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Obx(() {
                              return AnimatedOpacity(
                                //TODO implementar logica {se value for igual 1(sim) fica visivel }
                                // visible: _homeController.valueGroup.value == 2
                                //     ? false
                                //     : true,
                                duration: const Duration(milliseconds: 300),
                                opacity: _homeController.valueGroup.value == 2
                                    ? 0.0
                                    : 1.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Valor dividido para cada amigo",
                                      style: TextStyle(
                                        fontFamily: "Amaranth",
                                        fontSize: 14.sp,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                    Container(
                                      child: Center(
                                        child: Obx(() {
                                          return Text(
                                            "R\$ ${_homeController.valorTotalPessoa}",
                                            style: TextStyle(
                                              fontFamily: "Amaranth",
                                              fontSize: 14.sp,
                                              fontStyle: FontStyle.normal,
                                            ),
                                          );
                                        }),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            })
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
                        child: Text(
                          "Compartilhar",
                          style: TextStyle(
                            fontFamily: "Amaranth",
                            fontSize: 14.sp,
                            fontStyle: FontStyle.normal,
                          ),
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
