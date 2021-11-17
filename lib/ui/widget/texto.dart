import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Texto extends StatelessWidget {
  String text;
  double txtSize;
  FontWeight fontWeight;

  Texto({
    required this.text,
    required this.txtSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Amaranth",
        fontSize: txtSize.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}
