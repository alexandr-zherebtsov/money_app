import 'dart:convert';
import 'dart:developer';

import 'package:money_app/data/local_storage/local_storage.dart';
import 'package:money_app/data/repositories/account_repository.dart';
import 'package:money_app/domain/models/account_model.dart';

class AccountRepositoryImpl extends AccountRepository {
  final LocalStorage _storage;

  AccountRepositoryImpl(this._storage);

  @override
  Future<AccountModel?> getAccountData() async {
    AccountModel? res;
    try {
      final String? storageRes = await _storage.getAccount();
      if (storageRes == null) {
        res = await createAccount();
      } else {
        final Map<String, dynamic> locMap = jsonDecode(storageRes);
        res = AccountModel.fromJson(locMap);
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
    }
    return res;
  }

  @override
  Future<AccountModel?> createAccount() async {
    try {
      final account = AccountModel(
        price: 0,
      );
      await _storage.setAccount(
        jsonEncode(
          account.toJson(),
        ),
      );
      return account;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return null;
    }
  }
}
