import 'package:get/get.dart';
import 'package:money_app/presentation/router/routes.dart';
import 'package:money_app/shared/utils/utils.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    start();
  }

  void start() async {
    await delayedFunc(milliseconds: 1400);
    goTransactions();
  }

  void goTransactions() => Get.offAllNamed(AppRoutes.transactions);
}
