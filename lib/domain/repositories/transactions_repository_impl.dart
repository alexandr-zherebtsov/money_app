import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:money_app/data/local_storage/local_storage.dart';
import 'package:money_app/data/repositories/transactions_repository.dart';
import 'package:money_app/domain/models/account_model.dart';
import 'package:money_app/domain/models/transaction_model.dart';

class TransactionsRepositoryImpl extends TransactionsRepository {
  final LocalStorage _storage;

  TransactionsRepositoryImpl(this._storage);

  @override
  Future<List<TransactionModel>> getTransactions() async {
    List<TransactionModel> res = <TransactionModel>[];
    try {
      final String? storageRes = await _storage.getTransactions();
      if (storageRes != null) {
        res = (jsonDecode(storageRes) as List).map((e) => TransactionModel.fromJson(e)).toList();
        res.sort((i, j) => j.createdAt!.compareTo(i.createdAt!));
      }
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
    }
    return res;
  }

  @override
  Future<TransactionModel?> getTransactionById(final String id) async {
    try {
      final List<TransactionModel> storageRes = await getTransactions();
      return storageRes.firstWhereOrNull((e) => e.transactionId == id);
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return null;
    }
  }

  @override
  Future<bool> pay({
    required final TransactionModel v,
    required final AccountModel a,
  }) async {
    try {
      final List<TransactionModel> storageRes = await getTransactions();
      storageRes.add(v);
      List<Map<String, dynamic>> res = <Map<String, dynamic>>[];
      for (int i = 0; i < storageRes.length; i++) {
        res.add(storageRes[i].toJson());
      }
      await Future.wait([
        _storage.setTransactions(jsonEncode(res)),
        _storage.setAccount(jsonEncode(a.toJson())),
      ]);
      return true;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return false;
    }
  }

  @override
  Future<bool> setRepeatingPayment(final TransactionModel v) async {
    try {
      final List<TransactionModel> storageRes = await getTransactions();
      storageRes.removeWhere((e) => e.transactionId == v.transactionId);
      storageRes.add(v);
      List<Map<String, dynamic>> res = <Map<String, dynamic>>[];
      for (int i = 0; i < storageRes.length; i++) {
        res.add(storageRes[i].toJson());
      }
      return true;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return false;
    }
  }

  @override
  Future<bool> dividePayment({
    required final TransactionModel v,
    required final AccountModel a,
  }) async {
    try {
      final List<TransactionModel> storageRes = await getTransactions();
      storageRes.removeWhere((e) => e.transactionId == v.transactionId);
      storageRes.add(v);
      List<Map<String, dynamic>> res = <Map<String, dynamic>>[];
      for (int i = 0; i < storageRes.length; i++) {
        res.add(storageRes[i].toJson());
      }
      await Future.wait([
        _storage.setTransactions(jsonEncode(res)),
        _storage.setAccount(jsonEncode(a.toJson())),
      ]);
      return true;
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
      return false;
    }
  }
}
