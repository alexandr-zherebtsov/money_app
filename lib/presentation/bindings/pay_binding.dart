import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:money_app/data/local_storage/local_storage.dart';
import 'package:money_app/data/repositories/account_repository.dart';
import 'package:money_app/data/repositories/transactions_repository.dart';
import 'package:money_app/domain/repositories/account_repository_impl.dart';
import 'package:money_app/domain/repositories/transactions_repository_impl.dart';
import 'package:money_app/presentation/ui/pay/pay_controller.dart';

class PayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountRepository>(
      () => AccountRepositoryImpl(
        Get.find<Logger>(),
        Get.find<LocalStorage>(),
      ),
      fenix: true,
    );
    Get.lazyPut<TransactionsRepository>(
      () => TransactionsRepositoryImpl(
        Get.find<Logger>(),
        Get.find<LocalStorage>(),
      ),
      fenix: true,
    );
    Get.put(
      PayController(
        Get.find<AccountRepository>(),
        Get.find<TransactionsRepository>(),
      ),
    );
  }
}
