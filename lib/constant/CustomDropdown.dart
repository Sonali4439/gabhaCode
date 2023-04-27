
import 'package:flutter/material.dart';

import 'AppColors.dart';


AppColors appColors=AppColors();

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final void Function(String?) onChanged;
  const CustomDropdown({Key? key, required this.items, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items:
      items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
       // fillColor: ColorConst.lightColor,
        border: OutlineInputBorder(
            borderSide:
            BorderSide(color: appColors.mainHeadingColor),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: appColors.mainHeadingColor),
            borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: appColors.mainHeadingColor),
            borderRadius: BorderRadius.circular(5)),
        errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: appColors.errorBorder),
            borderRadius: BorderRadius.circular(5)),
      ),
      iconEnabledColor: appColors.mainHeadingColor,
    );
  }
}