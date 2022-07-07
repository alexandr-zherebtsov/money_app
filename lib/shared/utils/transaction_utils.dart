import 'package:get/get.dart';
import 'package:money_app/shared/core/localization/keys.dart';
import 'package:money_app/shared/enums/transaction_enums.dart';
import 'package:money_app/shared/styles/icons.dart';

bool isTopUp(final String? type) => mapTransactionsEnums[type] == TransactionsEnums.topUp;

String getTransactionIcon(final String? type) {
  switch (mapTransactionsEnums[type]) {
    case TransactionsEnums.pay:
      return AppIcons.icItemPay;
    case TransactionsEnums.topUp:
      return AppIcons.icItemTopUp;
    default:
      return '';
  }
}

String getTransactionTitle({
  required final String? type,
  required final String? merchantTitle,
}) {
  switch (mapTransactionsEnums[type]) {
    case TransactionsEnums.topUp:
      return StringsKeys.topUp.tr;
    default:
      return merchantTitle ?? '';
  }
}
