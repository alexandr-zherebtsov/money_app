import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/presentation/ui/transactions/transactions_controller.dart';
import 'package:money_app/presentation/ui/transactions/widgets/card_widget.dart';
import 'package:money_app/presentation/ui/transactions/widgets/price_widget.dart';
import 'package:money_app/presentation/ui/transactions/widgets/transaction_item.dart';
import 'package:money_app/shared/core/localization/keys.dart';
import 'package:money_app/shared/enums/screen_enums.dart';
import 'package:money_app/shared/utils/date_utils.dart';
import 'package:money_app/shared/utils/utils.dart';
import 'package:money_app/shared/widgets/app_buttons.dart';
import 'package:money_app/shared/widgets/app_progress.dart';
import 'package:money_app/shared/widgets/error_screen.dart';
import 'package:money_app/shared/widgets/responsive_view.dart';

class TransactionsScreen extends GetView<TransactionsController> {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionsController>(
      autoRemove: false,
      builder: (_) {
        if (controller.screenEnum == ScreenEnums.error) {
          return const ErrorScreen();
        } else if (controller.screenEnum == ScreenEnums.loading) {
          return const AppProgress();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                StringsKeys.moneyApp.tr,
              ),
              actions: [
                SmallIconButton(
                  onPressed: controller.dropData,
                  icon: isApple() ? CupertinoIcons.delete : Icons.delete_outline,
                  color: Get.theme.appBarTheme.titleTextStyle?.color,
                  message: StringsKeys.clear,
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(250),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    _buildBackground(),
                    PriseWidget(
                      price: controller.account?.price,
                    ),
                    CardWidget(
                      onTapPay: controller.onTapPay,
                      onTapTopUp: controller.onTapTopUp,
                    ),
                  ],
                ),
              ),
            ),
            body: controller.transactions.isEmpty ? const ErrorScreen(
              title: StringsKeys.youHaveNoTransactions,
            ) : ResponsiveView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: controller.transactions.length,
                      itemBuilder: (_, i) {
                        return _buildTransactionItem(i);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ColoredBox(
              color: Get.theme.primaryColor,
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ColoredBox(
              color: Get.theme.scaffoldBackgroundColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 20,
      ),
      child: Text(
        StringsKeys.recentActivity.tr,
        style: Get.textTheme.labelLarge,
      ),
    );
  }

  Widget _buildTransactionItem(final int i) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Offstage(
          offstage: _checkDateSeparator(i),
          child: _buildDateSeparator(i),
        ),
        TransactionItem(
          item: controller.transactions[i],
          onTap: controller.goTransaction,
        ),
        _bottomSeparator(
          i: i,
          j: controller.transactions.length,
        ),
      ],
    );
  }

  Widget _buildDateSeparator(final int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 20,
      ),
      child: Text(
        getDateYT(controller.transactions[i].createdAt),
        style: Get.textTheme.labelSmall,
      ),
    );
  }

  bool _checkDateSeparator(final int i) {
    bool hideDate = false;
    if (i != controller.transactions.length && i != 0 && controller.transactions.isNotEmpty) {
      if (isTheSameDay(
        firstDate: controller.transactions[i - 1].createdAt,
        secondDate: controller.transactions[i].createdAt,
      )) {
        hideDate = true;
      }
    }
    return hideDate;
  }

  Widget _bottomSeparator({
    required final int i,
    required final int j,
  }) {
    return Offstage(
      offstage: i + 1 != j,
      child: const SafeArea(
        child: SizedBox(
          height: 8,
        ),
      ),
    );
  }
}
