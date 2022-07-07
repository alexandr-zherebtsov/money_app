import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:money_app/domain/models/transaction_model.dart';
import 'package:money_app/shared/utils/date_utils.dart';
import 'package:money_app/shared/utils/transaction_utils.dart';
import 'package:money_app/shared/utils/utils.dart';

class TransactionHeader extends StatelessWidget {
  final TransactionModel? transaction;

  const TransactionHeader({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                getTransactionIcon(transaction?.type),
                width: 66,
                height: 66,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${isTopUp(transaction?.type) ? '+' : ''}${priceParser(transaction?.price).split('.')[0]}.',
                          style: isTopUp(transaction?.type) ? Get.textTheme.headlineMedium?.copyWith(
                            fontSize: 37,
                            color: Get.theme.primaryColor,
                          ) : Get.textTheme.headlineMedium?.copyWith(
                            fontSize: 37,
                          ),
                        ),
                        TextSpan(
                          text: priceParser(transaction?.price).split('.')[1],
                          style: isTopUp(transaction?.type) ? Get.textTheme.headlineMedium?.copyWith(
                            color: Get.theme.primaryColor,
                          ) : Get.textTheme.headlineMedium?.copyWith(
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            getTransactionTitle(
              type: transaction?.type,
              merchantTitle: transaction?.merchantTitle,
            ),
            style: Get.textTheme.titleMedium,
          ),
          Text(
            getDateFormat(
              transaction?.createdAt,
              fullDate: true,
            ).toUpperCase(),
            style: Get.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
