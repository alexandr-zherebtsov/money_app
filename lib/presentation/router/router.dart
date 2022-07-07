import 'package:get/get.dart';
import 'package:money_app/presentation/bindings/pay_binding.dart';
import 'package:money_app/presentation/bindings/splash_binding.dart';
import 'package:money_app/presentation/bindings/transaction_details_binding.dart';
import 'package:money_app/presentation/bindings/transactions_binding.dart';
import 'package:money_app/presentation/router/routes.dart';
import 'package:money_app/presentation/ui/pay/pay_screen.dart';
import 'package:money_app/presentation/ui/splash/splash_screen.dart';
import 'package:money_app/presentation/ui/transaction_details/transaction_details_screen.dart';
import 'package:money_app/presentation/ui/transactions/transactions_screen.dart';
import 'package:money_app/shared/utils/utils.dart';

class AppRouter {
  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: _transition(),
    ),
    GetPage(
      name: AppRoutes.transactions,
      page: () => const TransactionsScreen(),
      binding: TransactionsBinding(),
      transition: _transition(),
    ),
    GetPage(
      name: AppRoutes.pay,
      page: () => const PayScreen(),
      binding: PayBinding(),
      transition: _transition(),
    ),
    GetPage(
      name: AppRoutes.transactionDetails,
      page: () => const TransactionDetailsScreen(),
      binding: TransactionDetailsBinding(),
      transition: _transition(),
    ),
  ];

  static Transition? _transition() => isMobile() ? null : Transition.fadeIn;
}
