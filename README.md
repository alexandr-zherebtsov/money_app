# MoneyApp

### Platforms

```
1 - Android
2 - iOS
3 - macOS
4 - Web
5 - Windows
```

### Architecture
Project using GetX for communication between layers

### Libraries & Tools

- [Flutter 3.0.4 • channel stable](https://flutter.dev)
- [Dart 2.17.5](https://dart.dev)
- [DevTools 2.12.2](https://docs.flutter.dev/development/tools/devtools/overview)

Core
- [get](https://github.com/jonataslaw/getx)

Local storage
- [get_storage](https://github.com/jonataslaw/get_storage)

UI
- [overlay_support](https://github.com/boyan01/overlay_support)
- [cupertino_icons](https://github.com/flutter/packages/tree/master/third_party/packages/cupertino_icons)

Utils
- [intl](https://github.com/dart-lang/intl)
- [logger](https://github.com/leisim/logger)
- [url_strategy](https://github.com/simpleclub/url_strategy)

Dev Dependencies
- [flutter_lints](https://github.com/flutter/packages/tree/main/packages/flutter_lints)
- [flutter_launcher_icons_maker](https://github.com/gsmlg-dev/flutter_launcher_icons_maker)

### Directory Structure
Here is the core directory structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- macos
|- test
|- web
|- windows
```

Here is the directory structure we have been using in this project

```
lib/
|- data/
|- domain/
|- presentation/
|- shared/
|- main.dart
```

Now, lets dive into the lib directory which has the main code for the application.

```
1 - data - Contains the data layer of project, includes directories for local, network and shared pref/cache.
2 - domain - Contains abstraction and business logic of project, includes models, responses, request, etc.
3 - presentation - Contains all the ui of project, contains sub directory for each screen.
4 - shared - Contains the utilities/common functions, styles of application.
5 - main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title etc.
```

### Main
This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title etc.

```dart
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
```
