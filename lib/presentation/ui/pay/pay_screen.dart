import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/presentation/ui/pay/components/pay_top_up.dart';
import 'package:money_app/presentation/ui/pay/components/pay_who.dart';
import 'package:money_app/presentation/ui/pay/pay_controller.dart';
import 'package:money_app/presentation/ui/pay/pay_enums.dart';
import 'package:money_app/shared/core/localization/keys.dart';
import 'package:money_app/shared/enums/screen_enums.dart';
import 'package:money_app/shared/widgets/app_buttons.dart';
import 'package:money_app/shared/widgets/app_progress.dart';
import 'package:money_app/shared/widgets/error_screen.dart';

class PayScreen extends GetView<PayController> {
  const PayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayController>(
      autoRemove: false,
      builder: (_) {
        if (controller.screenEnum == ScreenEnums.error) {
          return const ErrorScreen(
            hideBack: false,
          );
        } else if (controller.screenEnum == ScreenEnums.loading) {
          return const AppProgress();
        } else {
          return WillPopScope(
            onWillPop: controller.onWillPop,
            child: Scaffold(
              backgroundColor: Get.theme.primaryColor,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  StringsKeys.moneyApp.tr,
                ),
                actions: [
                  AppCancelButton(
                    onTap: controller.onWillPop,
                    color: Get.theme.appBarTheme.titleTextStyle?.color,
                  ),
                ],
              ),
              body: SafeArea(
                child: Builder(
                  builder: (_) {
                    if (controller.payEnum == PayEnums.payTopUp) {
                      return PayTopUp(
                        price: controller.price,
                        onTapNext: controller.onTapNext,
                      );
                    } else if (controller.payEnum == PayEnums.payWho) {
                      return PayWho(
                        whomTC: controller.whomTC,
                        onTapPay: controller.onTapPay,
                      );
                    } else {
                      return const ErrorScreen();
                    }
                  },
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
