import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayPriceWidget extends StatelessWidget {
  final RxString price;

  const PayPriceWidget({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Obx(
          () => Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '£',
                  style: Get.textTheme.displayLarge?.copyWith(
                    fontSize: 25,
                  ),
                ),
                TextSpan(
                  text: _getLargeSymbols(price.value),
                  style: Get.textTheme.displayLarge,
                ),
                TextSpan(
                  text: _getLargeSmall(price.value),
                  style: Get.textTheme.displayLarge?.copyWith(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getLargeSymbols(String v) {
    if (v.contains('.')) {
      return v.split('.')[0];
    } else {
      return v;
    }
  }

  String _getLargeSmall(String v) {
    if (v.contains('.')) {
      return '.${price.value.split('.')[1]}';
    } else {
      return '';
    }
  }
}
