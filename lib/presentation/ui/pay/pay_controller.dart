import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:money_app/data/repositories/account_repository.dart';
import 'package:money_app/data/repositories/transactions_repository.dart';
import 'package:money_app/domain/models/account_model.dart';
import 'package:money_app/domain/models/transaction_model.dart';
import 'package:money_app/presentation/ui/pay/pay_enums.dart';
import 'package:money_app/shared/core/localization/keys.dart';
import 'package:money_app/shared/enums/screen_enums.dart';
import 'package:money_app/shared/enums/transaction_enums.dart';
import 'package:money_app/shared/utils/date_utils.dart';
import 'package:money_app/shared/utils/utils.dart';
import 'package:overlay_support/overlay_support.dart';

class PayController extends GetxController {
  final AccountRepository _accountRepository;
  final TransactionsRepository _transactionsRepository;

  PayController(
    this._accountRepository,
    this._transactionsRepository,
  );

  ScreenEnums popResult = ScreenEnums.none;

  ScreenEnums _screenEnum = ScreenEnums.loaded;
  ScreenEnums get screenEnum => _screenEnum;
  set screenEnum(ScreenEnums v) {
    _screenEnum = v;
    update();
  }

  PayEnums _payEnum = PayEnums.payTopUp;
  PayEnums get payEnum => _payEnum;
  set payEnum(PayEnums v) {
    _payEnum = v;
    update();
  }

  AccountModel? account;

  RxString price = ''.obs;
  final TextEditingController whomTC = TextEditingController();
  TransactionsEnums transactionEnum = TransactionsEnums.none;

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      transactionEnum = Get.arguments as TransactionsEnums;
      screenEnum = ScreenEnums.loading;
      await getAccountData();
      screenEnum = ScreenEnums.loaded;
      if (account == null) {
        screenEnum = ScreenEnums.error;
      }
    } else {
      screenEnum = ScreenEnums.error;
    }
  }

  Future<void> getAccountData() async {
    account = await _accountRepository.getAccountData();
  }

  void onTapNext() {
    if (price.value.isEmpty) {
      toast(StringsKeys.somethingWentWrong.tr);
    } else {
      if (transactionEnum == TransactionsEnums.pay) {
        if (_checkPayment()) {
          payEnum = PayEnums.payWho;
        } else {
          toast(StringsKeys.somethingWentWrong.tr);
        }
      } else {
        payment();
      }
    }
  }

  void onTapPay() {
    if (whomTC.text.trim().isEmpty) {
      toast(StringsKeys.somethingWentWrong.tr);
    } else {
      payment();
    }
  }

  bool _checkPayment() {
    final double? v = double.tryParse(price.value);
    final double? e = account?.price;
    if (v != null && e != null) {
      return account!.price! >= v && v > 0;
    } else {
      return false;
    }
  }

  void payment() async {
    screenEnum = ScreenEnums.loading;
    if (transactionEnum == TransactionsEnums.topUp) {
      account!.price = account!.price! + double.parse(price.value);
    } else {
      account!.price = account!.price! - double.parse(price.value);
    }
    final bool res = await _transactionsRepository.pay(
      v: TransactionModel(
        transactionId: generateId(),
        merchantId: clearAndTrim(whomTC.text),
        merchantTitle: whomTC.text.trim(),
        price: double.tryParse(price.value),
        createdAt: getMillisecondsSinceEpochDateTime(DateTime.now()),
        repeatingPayment: false,
        type: transactionEnum.getName,
        alreadySplitBefore: false,
      ),
      a: account!,
    );
    screenEnum = ScreenEnums.loaded;
    if (res) {
      popResult = ScreenEnums.refresh;
      toast(StringsKeys.done.tr);
    } else {
      toast(StringsKeys.somethingWentWrong.tr);
    }
    onWillPop();
  }

  Future<bool> onWillPop() async {
    Get.back(result: popResult);
    return false;
  }
}
