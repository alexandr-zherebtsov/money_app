import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:money_app/presentation/bindings/global_binding.dart';
import 'package:money_app/presentation/router/router.dart';
import 'package:money_app/presentation/router/routes.dart';
import 'package:money_app/shared/constants/app_values.dart';
import 'package:money_app/shared/core/localization/keys.dart';
import 'package:money_app/shared/core/localization/translations.dart';
import 'package:money_app/shared/styles/themes.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  if (kIsWeb) {
    setPathUrlStrategy();
  }
  runApp(const MoneyApp());
}

class MoneyApp extends StatelessWidget {
  const MoneyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        navigatorKey: Get.key,
        getPages: AppRouter.routes,
        initialRoute: AppRoutes.splash,
        title: StringsKeys.moneyApp.tr,
        initialBinding: GlobalBinding(),
        translations: AppTranslations(),
        locale: const Locale(AppValues.langCodeEN),
        theme: AppThemes.getTheme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
