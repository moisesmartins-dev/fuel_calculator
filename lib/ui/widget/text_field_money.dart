import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sizer/sizer.dart';

class TextFieldMoneyCustom extends StatelessWidget {
  String labelTxt;
  String? prefixTxt;
  String? helperTxt;
  double width;

  TextFieldMoneyCustom({
    required this.labelTxt,
    required this.width,
    this.prefixTxt,
    this.helperTxt,
  });

  var moneyMaskFormatter = new MaskTextInputFormatter(
      mask: '#,###.###.#', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.h,
      child: new TextFormField(
        // controller: textEditingController,
        keyboardType: TextInputType.number,
        textDirection: TextDirection.rtl,
        inputFormatters: [
          moneyMaskFormatter,
        ],
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            borderSide: BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            borderSide: BorderSide(
              width: 1,
              color: Colors.black,
            ),
          ),
          labelText: labelTxt,
          labelStyle: GoogleFonts.amaranth(
            color: Colors.black,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal,
          ),
          prefixText: prefixTxt,
          prefixStyle: GoogleFonts.amaranth(
            color: Colors.black,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal,
          ),
          helperText: helperTxt,
          helperStyle: GoogleFonts.amaranth(
            color: Colors.black,
            fontSize: 9.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        style: GoogleFonts.amaranth(
          color: Colors.black,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        ),
        cursorColor: Colors.black,
      ),
    );
  }
}
