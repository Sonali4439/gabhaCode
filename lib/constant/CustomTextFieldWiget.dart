import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AppColors.dart';

AppColors appColors=AppColors();

class CustomFieldBox extends StatelessWidget {
  final String? label;
  final String? inputValue;
  final String? errorText, jobTitle;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obsecureText;
  final Widget? suffixIcon, prefixIcon;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final TextEditingController? controller;
  final bool readOnly;
  final void Function()? onTap;
  final String? initialValue;
  final AutovalidateMode? autovalidateMode;
  const CustomFieldBox(
      {Key? key,
        this.label,
        this.jobTitle,
        this.inputValue,
        this.onChanged,
        this.errorText,
        this.validator,
        this.suffixIcon,
        this.prefixIcon,
        this.initialValue,
        this.keyboardType,
        this.autofillHints,
        this.inputFormatters,
        this.obsecureText = false,
        this.maxLines = 1,
        this.controller,
        this.readOnly = false,
        this.onTap,
        this.autovalidateMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
                color: appColors.hintHeadingColor,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 8,
          )
        ],
        TextFormField(
          autovalidateMode: autovalidateMode,
          readOnly: readOnly,
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obsecureText,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          controller: controller,
          //title: jobTitle,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            fillColor: Colors.white,
            filled: true,
            errorText: errorText,
            hintText: inputValue!,
            hintStyle:
            TextStyle(color: appColors.textFieldHintColor, fontSize: 15),
            border:  OutlineInputBorder(
              borderSide: BorderSide(color: appColors.mainHeadingColor,width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: appColors.mainHeadingColor,width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: appColors.mainHeadingColor,width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            errorBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: appColors.errorBorder,width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ],
    );
  }
}