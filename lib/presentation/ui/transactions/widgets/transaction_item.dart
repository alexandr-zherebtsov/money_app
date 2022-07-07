import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:money_app/domain/models/transaction_model.dart';
import 'package:money_app/shared/utils/transaction_utils.dart';
import 'package:money_app/shared/utils/utils.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel item;
  final void Function(String? i) onTap;

  const TransactionItem({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.theme.cardColor,
      child: InkWell(
        onTap: () => onTap(item.transactionId),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                getTransactionIcon(item.type),
                width: 22,
                height: 22,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: Text(
                    getTransactionTitle(
                      type: item.type,
                      merchantTitle: item.merchantTitle,
                    ),
                    style: Get.textTheme.titleSmall,
                  ),
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${isTopUp(item.type) ? '+' : ''}${priceParser(item.price).split('.')[0]}.',
                      style: isTopUp(item.type) ? Get.textTheme.headlineMedium?.copyWith(
                        color: Get.theme.primaryColor,
                      ) : Get.textTheme.headlineMedium,
                    ),
                    TextSpan(
                      text: priceParser(item.price).split('.')[1],
                      style: isTopUp(item.type) ? Get.textTheme.headlineMedium?.copyWith(
                        color: Get.theme.primaryColor,
                      ) : Get.textTheme.headlineMedium?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
