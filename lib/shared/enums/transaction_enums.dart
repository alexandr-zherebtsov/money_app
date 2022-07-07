import 'package:money_app/shared/constants/app_values.dart';
import 'package:flutter/foundation.dart';

enum TransactionsEnums {
  pay,
  topUp,
  none,
}

const Map<String, TransactionsEnums> mapTransactionsEnums = <String, TransactionsEnums> {
  AppValues.transactionPay: TransactionsEnums.pay,
  AppValues.transactionTopUp: TransactionsEnums.topUp,
};

extension TransactionsEnumsX on TransactionsEnums {
  String get name => describeEnum(this);

  String get getName {
    switch (this) {
      case TransactionsEnums.pay:
        return AppValues.transactionPay;
      case TransactionsEnums.topUp:
        return AppValues.transactionTopUp;
      default:
        return '';
    }
  }
}
