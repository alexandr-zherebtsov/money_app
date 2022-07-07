import 'package:get/get.dart';
import 'package:money_app/data/repositories/account_repository.dart';
import 'package:money_app/data/repositories/transactions_repository.dart';
import 'package:money_app/domain/models/account_model.dart';
import 'package:money_app/domain/models/transaction_model.dart';
import 'package:money_app/shared/core/localization/keys.dart';
import 'package:money_app/shared/enums/screen_enums.dart';
import 'package:overlay_support/overlay_support.dart';

class TransactionDetailsController extends GetxController {
  final AccountRepository _accountRepository;
  final TransactionsRepository _transactionsRepository;

  TransactionDetailsController(
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

  AccountModel? account;
  TransactionModel? transaction;

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      screenEnum = ScreenEnums.loading;
      await Future.wait([
        getAccountData(),
        getTransaction(),
      ]);
      screenEnum = ScreenEnums.loaded;
      if (transaction == null || account == null) {
        screenEnum = ScreenEnums.error;
      }
    } else {
      screenEnum = ScreenEnums.error;
    }
  }

  Future<void> getAccountData() async {
    account = await _accountRepository.getAccountData();
  }

  Future<void> getTransaction() async {
    final String id = Get.arguments as String;
    transaction = await _transactionsRepository.getTransactionById(id);
  }

  void addReceipt() {}

  void splitThisBill() async {
    if (transaction?.price != null && transaction?.alreadySplitBefore != null) {
      if (transaction!.alreadySplitBefore!) {
        toast(StringsKeys.alreadySplitBefore.tr);
      } else {
        final double res = transaction!.price! / 2;
        transaction!.price = res;
        account!.price = account!.price! + res;
        transaction?.alreadySplitBefore = true;
        popResult = ScreenEnums.refresh;
        update();
        await _transactionsRepository.dividePayment(
          v: transaction!,
          a: account!,
        );
        toast(StringsKeys.done.tr);
      }
    } else {
      toast(StringsKeys.somethingWentWrong.tr);
    }
  }

  void repeatingPayment() async {
    transaction!.repeatingPayment = !(transaction!.repeatingPayment ?? false);
    update();
    await _transactionsRepository.setRepeatingPayment(transaction!);
    toast(StringsKeys.done.tr);
  }

  void getHelp() => toast(StringsKeys.helpIsOnTheWayStayPut.tr);

  Future<bool> onWillPop() async {
    Get.back(result: popResult);
    return false;
  }
}
