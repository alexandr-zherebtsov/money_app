import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:money_app/shared/styles/colors.dart';

enum TransactionActionEnums {
  switchAction,
  onTapAction,
}

class TransactionActionItem extends StatelessWidget {
  final TransactionActionEnums action;
  final EdgeInsets margin;
  final String title;
  final void Function() function;
  final Color? color;
  final String? icon;
  final bool? switchValue;
  final bool offstage;

  const TransactionActionItem({
    Key? key,
    this.action = TransactionActionEnums.onTapAction,
    this.margin = EdgeInsets.zero,
    required this.title,
    required this.function,
    this.color,
    this.icon,
    this.switchValue,
    this.offstage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: offstage,
      child: Padding(
        padding: margin,
        child: SizedBox(
          height: 50,
          child: Material(
            color: Get.theme.cardColor,
            child: InkWell(
              onTap: action == TransactionActionEnums.onTapAction ? function : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Row(
                  children: [
                    icon == null ? const Offstage() : Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(
                        icon!,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title.tr,
                        style: Get.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: color,
                        ),
                      ),
                    ),
                    Offstage(
                      offstage: action != TransactionActionEnums.switchAction,
                      child: Switch.adaptive(
                        activeColor: AppColors.green,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: switchValue ?? false,
                        onChanged: (_) {
                          function();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
