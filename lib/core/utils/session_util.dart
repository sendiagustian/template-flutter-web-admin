import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'encrypter_util.dart';

class SessionUtil {
  SessionUtil();

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  final EncrypterUtil _encrypter = EncrypterUtil();

  final String authKey = 'AUTH';

  Future<void> writeSession(String key, String value) async {
    String valueEncrypted = _encrypter.encryptData(value);
    return await _storage.write(key: key, value: valueEncrypted);
  }

  Future<String?> readSession(String key) async {
    String? result = await _storage.read(key: key);
    if (result != null) {
      return _encrypter.decryptData(result);
    } else {
      return null;
    }
  }

  Future<Map<String, String>> readAllSession() async {
    Map<String, String> data = {};
    Map<String, String> result = await _storage.readAll();
    result.forEach((key, value) {
      Map<String, String> wadah = {key: _encrypter.decryptData(value)};
      data.addEntries(wadah.entries);
    });
    return data;
  }

  Future<void> deleteSession(String key) async {
    return await _storage.delete(key: key);
  }

  Future<void> clearSession() {
    return _storage.deleteAll();
  }
}
