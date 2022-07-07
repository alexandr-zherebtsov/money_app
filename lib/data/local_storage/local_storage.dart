import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage extends GetxController {
  final GetStorage _box = GetStorage();

  static const String _account = '_account';
  static const String _transactions = '_transactions';

  Future<void> setAccount(String? v) async => await _setValue(_account, v);
  Future<String?> getAccount() async => await _getValue(_account);

  Future<void> setTransactions(String? v) async => await _setValue(_transactions, v);
  Future<String?> getTransactions() async => await _getValue(_transactions);

  Future<T> _getValue<T>(String key) async => await _box.read(key) as T;

  Future<void> _setValue<T>(String key, T v) async => await _box.write(key, v);

  Future<void> clearBox() async {
    await Future.wait([
      _box.remove(_account),
      _box.remove(_transactions),
    ]);
  }
}
