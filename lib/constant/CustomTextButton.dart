import 'package:flutter/material.dart';

import 'AppColors.dart';

AppColors appColors=AppColors();


class CustomTextButton extends StatelessWidget {
  final String? title;
  final double titleSize, radius, borderWidth, padding;
  final double? paddingSize;
  final double? elevation;
  final Color titleColor, buttonColor, borderColor;
  final Icon? iconName;
  final Function()? onPressed;
  final FontWeight? fontWeight;

  const CustomTextButton({
    Key? key,
    required this.title,
    this.paddingSize=2,
    this.titleSize = 18,
    this.titleColor = Colors.white,
    this.buttonColor = Colors.green,
    this.borderColor = Colors.green,
    required this.onPressed,
    this.elevation = 0,
    this.iconName,

    this.radius = 12,
    this.borderWidth = 1,
    this.fontWeight = FontWeight.w400,
    this.padding = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.symmetric(vertical: padding),

        child: Row(
          mainAxisAlignment:
          MainAxisAlignment
              .center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  title!,
                  style: TextStyle(
                      color: titleColor, fontSize: titleSize, fontWeight: fontWeight),
                ),
              ),
            ),
           Padding(
             padding: EdgeInsets.only(right: paddingSize!),
             child: iconName!,
           )

           /* Padding(
              padding: const EdgeInsets.only(right: 15),
              child:icon
            ),*/
          ],
        ),
      ),
    );
  }
}