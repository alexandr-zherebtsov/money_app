import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/shared/core/localization/keys.dart';
import 'package:money_app/shared/styles/colors.dart';
import 'package:money_app/shared/utils/utils.dart';

class AppMainButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final EdgeInsets margin;

  const AppMainButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: MaterialButton(
        height: 60,
        minWidth: 200,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        color: AppColors.primaryLight.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: onPressed,
        child: Text(
          title.tr,
          style: Get.textTheme.displayLarge?.copyWith(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class AppBackButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;

  const AppBackButton({
    Key? key,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: StringsKeys.back.tr,
      icon: Icon(
        isApple() ? CupertinoIcons.back : Icons.arrow_back,
        color: color,
      ),
      onPressed: onTap ?? Get.back,
    );
  }
}

class AppCancelButton extends StatelessWidget {
  final void Function()? onTap;
  final Color? color;

  const AppCancelButton({
    Key? key,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: StringsKeys.cancel.tr,
      child: InkWell(
        focusColor: AppColors.transparent,
        hoverColor: AppColors.transparent,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            isApple() ? CupertinoIcons.clear_thick_circled : Icons.cancel,
            color: color,
          ),
        ),
      ),
    );
  }
}

class SmallIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final String message;
  final Color? color;

  const SmallIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.message,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message.tr,
      child: MaterialButton(
        minWidth: 10,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 22,
            color: color,
          ),
        ),
      ),
    );
  }
}
