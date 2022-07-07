import 'package:flutter/material.dart';
import 'package:money_app/shared/styles/colors.dart';

InputDecoration inputDecorationUnderline(final Color? color) {
  return InputDecoration(
    border: inputBorderUnderline(color),
    errorBorder: inputBorderUnderline(color),
    focusedBorder: inputBorderUnderline(color),
    enabledBorder: inputBorderUnderline(color),
    disabledBorder: inputBorderUnderline(color),
    focusedErrorBorder: inputBorderUnderline(color),
  );
}

UnderlineInputBorder inputBorderUnderline(final Color? color) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      color: color ?? AppColors.white,
      width: 2,
    ),
  );
}
