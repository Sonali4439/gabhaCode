import 'package:flutter/material.dart';
import 'AppColors.dart';


class ButtonFilledGreen extends StatelessWidget {
  AppColors appColors = AppColors();
  double? containerWidth;
  double? containerHeight;
  String? buttonText;

  ButtonFilledGreen(this.containerWidth,
      this.containerHeight,
      this.buttonText,
      {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: appColors.themeColorFilledButton,
      width: containerWidth,
      height: containerHeight,
      child: Center(
        child: Padding(
          padding:
          const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment
                .center,
            children: [
              Expanded(
                child: Center(
                  child: Text( "  ${buttonText}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

