import 'package:flutter/material.dart';

class AppColors{
 /* Color mainHeadingColor = HexColor("#00A36D");*/
  Color mainHeadingColor = HexColor("#00A46C");
  Color subHeadingColor = HexColor("#767676");
  Color progressColor = HexColor("#D9D9D9");
  Color hintHeadingColor = HexColor("#404040");
  Color addChildColor = HexColor("#1BB1F6");
  Color errorBorder = HexColor("#ff0000");
  Color memberShipColor =HexColor("#FFCA00");
  Color containerBorderColor =HexColor("#C5C5C5");
  Color textFieldHintColor =HexColor("#9A9A9A");

  //grey color box border background use for dropdown
  BoxDecoration greyColorBorderBoxDropDown = BoxDecoration(
      border: Border.all(color: const Color(0xffB8B8B8)),
      color: const Color(0xffffffff),
      borderRadius: const BorderRadius.all(Radius.circular(5))
  );

  //theme color use for button
  BoxDecoration themeColorFilledButton = BoxDecoration(
      color: const Color(0xff00A36D),
      borderRadius: const BorderRadius.all(Radius.circular(12))
  );

  //text field value style use for registration form
  TextStyle textInputValueStyleTheme18 = const TextStyle(
      color: Color(0xff0000000),
      fontSize: 17);

  //text field error border outline
  OutlineInputBorder textFieldErrorBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xffff0000)),
    borderRadius: BorderRadius.circular(5),
  );


  //text enable border
  OutlineInputBorder textFieldDefault = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xff00A36D),width: 2),
    borderRadius: BorderRadius.circular(5),
  );


 //text field hint style
  TextStyle hintStyleGrey14 = const TextStyle(
      fontFamily: "Rubik-regular",
      color: Color(0xff9A9A9A),
      fontSize: 14);

  // dropdown
  BoxDecoration borderBoxDropDown = BoxDecoration(
      border: Border.all(color: Color(0xff00A36D)),
      color: const Color(0xffffffff),
      borderRadius: const BorderRadius.all(Radius.circular(5))
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}