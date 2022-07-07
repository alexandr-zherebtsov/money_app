import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayHeader extends StatelessWidget {
  final String header;
  final Widget child;

  const PayHeader({
    Key? key,
    required this.header,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Text(
            header.tr,
            style: Get.textTheme.displayLarge?.copyWith(
              fontSize: 25,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
