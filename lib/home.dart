import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fuel_calculator/widget/text_field.dart';
import 'package:fuel_calculator/widget/text_field_money.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sizer/sizer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: SizerUtil.deviceType == DeviceType.mobile
                ? Size.fromHeight(7.h) // Widget for Mobile
                : Size.fromHeight(7.h), // Widget for Tablet
            // here the desired height

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
                            labelTxt: "km/litro",
                            width: 14,
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
                            prefixTxt: "R\$ ",
                            labelTxt: "Reais",
                            width: 14,
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
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
                        height: 3.h,
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
                                    child: Text(
                                      "R\$ 320",
                                      style: TextStyle(
                                        fontFamily: "Amaranth",
                                        fontSize: 14.sp,
                                        fontStyle: FontStyle.normal,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Visibility(
                              visible: true,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Valor total dividido entre amigos",
                                    style: TextStyle(
                                      fontFamily: "Amaranth",
                                      fontSize: 14.sp,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                  Container(
                                    child: Center(
                                      child: Text(
                                        "R\$ 320",
                                        style: TextStyle(
                                          fontFamily: "Amaranth",
                                          fontSize: 14.sp,
                                          fontStyle: FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
