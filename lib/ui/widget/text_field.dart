import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextFieldCustom extends StatelessWidget {
  String labelTxt;
  String? prefixTxt;
  String? helperTxt;
  String? txtValue;
  double width;
  ValueChanged? valueChanged;
  TextEditingController textEditingController;

  TextFieldCustom({
    required this.textEditingController,
    required this.labelTxt,
    required this.width,
    this.valueChanged,
    this.txtValue,
    this.prefixTxt,
    this.helperTxt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.h,
      child: new TextFormField(
        initialValue: txtValue,
        controller: textEditingController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        onChanged: valueChanged,
        inputFormatters: [
          LengthLimitingTextInputFormatter(5),
          FilteringTextInputFormatter.allow(RegExp('[0-9.]+')),
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
          labelStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Amaranth",
            fontSize: 11.sp,
            fontWeight: FontWeight.normal,
          ),
          prefixText: prefixTxt,
          prefixStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Amaranth",
            fontSize: 11.sp,
            fontWeight: FontWeight.normal,
          ),
          helperText: helperTxt,
          helperStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Amaranth",
            fontSize: 9.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Amaranth",
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        ),
        cursorColor: Colors.black,
      ),
    );
  }
}
