import 'package:flutter/material.dart';

import 'AppColors.dart';

class TextRubikRegular extends StatelessWidget {
  AppColors appColors = AppColors();

  String title;
  String align;
  double sizeBig;
  // double sizeSmall;
  Color color;
  bool isBold;


  TextRubikRegular(this.title, this.align, this.sizeBig, this.color, this.isBold, {super.key}
      // {this.sizeSmall}
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(title,
        textAlign: align == "left"
            ? TextAlign.start
            : align == "right"
            ? TextAlign.end
            : TextAlign.center,
        style: TextStyle(

            color: color,
            fontSize:
            // sizeSmall == null ?
            sizeBig,
            // :  WidgetsBinding.instance.window.physicalSize.width >= 1080 ?
            // // 19.0 : 16.0,
            // sizeBig : sizeSmall,
            // sizeBig,
            fontFamily: 'Rubik-dark',
            fontWeight:

            isBold == true ? FontWeight.bold : FontWeight.normal));
  }
}