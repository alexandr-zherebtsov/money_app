import 'package:get/get.dart';
import 'package:money_app/data/local_storage/local_storage.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorage>(
      () => LocalStorage(),
      fenix: true,
    );
  }
}
