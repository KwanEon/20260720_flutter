import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AccountStore {
  AccountStore._(this._preferences, this._accounts);

  static const _accountsKey = 'local_accounts';
  static const _defaultUserId = 'admin';
  static const _defaultPassword = '1';

  final SharedPreferences _preferences;
  final Map<String, String> _accounts;

  static Future<AccountStore> create() async {
    final preferences = await SharedPreferences.getInstance();
    final accounts = _readAccounts(preferences);
    final store = AccountStore._(preferences, accounts);

    if (!accounts.containsKey(_defaultUserId)) {
      accounts[_defaultUserId] = _defaultPassword;
      await store._save();
    }

    return store;
  }

  bool authenticate(String userId, String password) {
    return _accounts[userId.trim()] == password;
  }

  Future<bool> register(String userId, String password) async {
    final normalizedUserId = userId.trim();

    if (_accounts.containsKey(normalizedUserId)) {
      return false;
    }

    _accounts[normalizedUserId] = password;
    await _save();
    return true;
  }

  static Map<String, String> _readAccounts(SharedPreferences preferences) {
    final encodedAccounts = preferences.getString(_accountsKey);
    if (encodedAccounts == null) {
      return {};
    }

    try {
      final decodedAccounts = jsonDecode(encodedAccounts);
      if (decodedAccounts is! Map<String, dynamic>) {
        return {};
      }

      return decodedAccounts.map((userId, password) {
        return MapEntry(userId, password.toString());
      });
    } on FormatException {
      return {};
    }
  }

  Future<void> _save() {
    return _preferences.setString(_accountsKey, jsonEncode(_accounts));
  }
}
