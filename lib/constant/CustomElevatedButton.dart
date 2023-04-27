import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget{

  const CustomElevatedButton({
    Key? key,
    required this.buttonText,
    required this.buttonTextFont,
    required this.buttonTextColour,
    required this.buttonTextIsBold,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonBorderRadius,
    required this.buttonBorderRadiusColor,
    required this.iconAlignment,
    required this.onPressed,
    required this.buttonColor,
    required this.buttonIconData,
    required this.buttonIconColor,
    required this.buttonIconSize,
  }) : super(key: key);

  final String buttonText;
  final double buttonTextFont;
  final Color buttonTextColour;
  final bool buttonTextIsBold;
  final VoidCallback onPressed;
  final Color buttonColor;
  //
  final double buttonHeight;
  final double buttonWidth;
  final double buttonBorderRadius;
  final Color buttonBorderRadiusColor;
  final String iconAlignment;
  final IconData buttonIconData;
  final Color buttonIconColor;
  final double buttonIconSize;






  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
            border: Border.all(color: buttonBorderRadiusColor),
            color: buttonColor,
            borderRadius:  BorderRadius.all(Radius.circular(buttonBorderRadius))
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(buttonText,
                      style: TextStyle(
                          fontSize:  buttonTextFont,
                          color: buttonTextColour,
                          fontWeight: buttonTextIsBold == true ? FontWeight.bold : FontWeight.normal
                      ),
                    ),
                    if(iconAlignment == "center")
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(buttonIconData,color: buttonIconColor, size: buttonIconSize)),
                      )
                  ],
                ),
              ),
            ),
            if(iconAlignment == "right")
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(buttonIconData,color: buttonIconColor, size: buttonIconSize,)),
              )
          ],
        ),
      ),
    );
  }

}