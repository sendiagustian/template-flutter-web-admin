import 'package:encrypt/encrypt.dart';

class EncrypterUtil {
  String keyString = 'hIwQI3DVrBYD8W50TPYsifOhKxjszpO7';
  String ivString = 'oCFK0ubaCPW71JMw';

  String encryptData(String plainText) {
    final key = Key.fromUtf8(keyString);
    final iv = IV.fromUtf8(ivString);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base16;
  }

  String decryptData(String encryptedText) {
    final key = Key.fromUtf8(keyString);
    final iv = IV.fromUtf8(ivString);
    final encrypter = Encrypter(AES(key));
    final encrypted = Encrypted.fromBase16(encryptedText);
    return encrypter.decrypt(encrypted, iv: iv);
  }
}
