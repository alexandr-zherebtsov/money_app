import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:money_app/data/local_storage/local_storage.dart';
import 'package:money_app/data/repositories/account_repository.dart';
import 'package:money_app/domain/models/account_model.dart';

class AccountRepositoryImpl extends AccountRepository {
  final Logger _logger;
  final LocalStorage _storage;

  AccountRepositoryImpl(
    this._logger,
    this._storage,
  );

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
      _logger.d(res?.toJson());
    } catch (e) {
      _logger.d(e);
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
    } catch (e) {
      _logger.d(e);
      return null;
    }
  }
}
