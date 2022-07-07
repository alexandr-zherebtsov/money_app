import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:money_app/data/local_storage/local_storage.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Logger>(
      () => Logger(
        printer: PrettyPrinter(
          printEmojis: false,
        ),
      ),
      fenix: true,
    );
    Get.lazyPut<LocalStorage>(
      () => LocalStorage(),
      fenix: true,
    );
  }
}
