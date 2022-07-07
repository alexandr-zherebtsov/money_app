import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/presentation/ui/pay/widget/pay_header.dart';
import 'package:money_app/shared/constants/app_values.dart';
import 'package:money_app/shared/core/localization/keys.dart';
import 'package:money_app/shared/styles/styles.dart';
import 'package:money_app/shared/widgets/app_buttons.dart';
import 'package:money_app/shared/widgets/responsive_view.dart';

class PayWho extends StatelessWidget {
  final TextEditingController whomTC;
  final void Function() onTapPay;

  const PayWho({
    Key? key,
    required this.whomTC,
    required this.onTapPay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PayHeader(
          header: StringsKeys.toWhom,
          child: SizedBox(
            height: 100,
            child: ResponsiveView(
              maxWidth: AppValues.secondaryWidthLimiter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 44,
                ),
                child: TextField(
                  controller: whomTC,
                  cursorColor: Get.textTheme.displayLarge?.color,
                  style: Get.textTheme.displayLarge?.copyWith(
                    fontSize: 25,
                  ),
                  decoration: inputDecorationUnderline(Get.textTheme.displayLarge?.color),
                ),
              ),
            ),
          ),
        ),
        AppMainButton(
          title: StringsKeys.next,
          margin: const EdgeInsets.only(
            bottom: 34,
          ),
          onPressed: onTapPay,
        ),
      ],
    );
  }
}
