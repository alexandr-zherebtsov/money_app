import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/shared/styles/colors.dart';
import 'package:money_app/shared/utils/utils.dart';

class NumericKeyboard extends StatelessWidget {
  final RxString value;
  final int maxLength;
  final double size;

  const NumericKeyboard({
    Key? key,
    required this.value,
    this.maxLength = 6,
    this.size = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSpacer(),
        _buildRow(
          children: [
            _buttonWidget('1'),
            _buttonWidget('2'),
            _buttonWidget('3'),
          ],
        ),
        _buildSpacer(),
        _buildRow(
          children: [
            _buttonWidget('4'),
            _buttonWidget('5'),
            _buttonWidget('6'),
          ],
        ),
        _buildSpacer(),
        _buildRow(
          children: [
            _buttonWidget('7'),
            _buttonWidget('8'),
            _buttonWidget('9'),
          ],
        ),
        _buildSpacer(),
        _buildRow(
          children: [
            _buttonWidget('.'),
            _buttonWidget('0'),
            _buildDelete(),
          ],
        ),
      ],
    );
  }

  Widget _buildDelete() {
    return InkWell(
      borderRadius: _getBorderRadius(),
      onTap: () {
        if (value.value.isNotEmpty) {
          value(value.value.substring(0, value.value.length - 1));
        }
        if (value.value.length > maxLength - 1) {
          value(value.value.substring(0, maxLength - 1));
        }
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: Icon(
            isApple() ? CupertinoIcons.back : Icons.arrow_back_ios_new,
            color: Get.textTheme.displayLarge?.color,
            size: 34,
          ),
        ),
      ),
    );
  }

  Widget _buildSpacer() => const SizedBox(height: 15);
  BorderRadius _getBorderRadius() => BorderRadius.circular(75);

  Widget _buildRow({
    required List<Widget> children,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  SizedBox _buttonWidget(String buttonText) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: AppColors.transparent,
        clipBehavior: Clip.hardEdge,
        borderRadius: _getBorderRadius(),
        child: InkWell(
          onTap: () {
            if (value.value.length <= (maxLength - 1)) {
              if (!(value.value.contains('.') && buttonText == '.')) {
                value(value.value + buttonText);
              }
            }
          },
          child: Center(
            child: Text(
              buttonText,
              style: Get.textTheme.displayLarge?.copyWith(
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
