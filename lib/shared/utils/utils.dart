import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isMobile() {
  return Get.theme.platform == TargetPlatform.android || Get.theme.platform == TargetPlatform.iOS;
}

bool isApple() {
  return Get.theme.platform == TargetPlatform.macOS || Get.theme.platform == TargetPlatform.iOS;
}

String priceParser(final double? v) {
  try {
    if (v != null) {
      final String price = v.toString();
      if (price.split('.')[1] == '0' || price.split('.')[1] == '00') {
        return '${price.split('.')[0]}.00';
      } else if (price.split('.')[1].length == 1) {
        return '${price}0';
      } else {
        return price;
      }
    } else {
      return '0.00';
    }
  } catch (_) {
    return '0.00';
  }
}

String clearAndTrim(String? value) {
  if (value != null) {
    return value.replaceAll(' ', '');
  } else {
    return '';
  }
}

String generateId() {
  return (1000 + math.Random().nextInt(100)).toString() + DateTime.now().toString().replaceAll(' ', '').replaceAll('+', '')
      .replaceAll('-', '').replaceAll(':', '').replaceAll(',', '').replaceAll('.', '')
      + (1000000000 + math.Random().nextInt(10000000)).toString();
}

Future<void> delayedFunc({final int milliseconds = 1000}) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}
