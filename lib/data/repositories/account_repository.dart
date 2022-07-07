import 'package:money_app/domain/models/account_model.dart';

abstract class AccountRepository {
  Future<AccountModel?> getAccountData();

  Future<AccountModel?> createAccount();
}
