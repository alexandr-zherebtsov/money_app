import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/presentation/ui/pay/widget/pay_header.dart';
import 'package:money_app/presentation/ui/pay/widget/pay_price_widget.dart';
import 'package:money_app/presentation/ui/pay/widget/numeric_keyboard.dart';
import 'package:money_app/shared/core/localization/keys.dart';
import 'package:money_app/shared/widgets/app_buttons.dart';

class PayTopUp extends StatelessWidget {
  final RxString price;
  final void Function() onTapNext;

  const PayTopUp({
    Key? key,
    required this.price,
    required this.onTapNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PayHeader(
          header: StringsKeys.howMuch,
          child: PayPriceWidget(
            price: price,
          ),
        ),
        NumericKeyboard(
          value: price,
        ),
        AppMainButton(
          title: StringsKeys.next,
          margin: const EdgeInsets.only(
            bottom: 34,
          ),
          onPressed: onTapNext,
        ),
      ],
    );
  }
}
