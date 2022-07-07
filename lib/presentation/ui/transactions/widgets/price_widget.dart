import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/shared/utils/utils.dart';

class PriseWidget extends StatelessWidget {
  final double? price;

  const PriseWidget({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 0,
      left: 0,
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '£',
                style: Get.textTheme.displayLarge?.copyWith(
                  fontSize: 25,
                ),
              ),
              TextSpan(
                text: priceParser(price).split('.')[0],
                style: Get.textTheme.displayLarge,
              ),
              TextSpan(
                text: '.${priceParser(price).split('.')[1]}',
                style: Get.textTheme.displayLarge?.copyWith(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
