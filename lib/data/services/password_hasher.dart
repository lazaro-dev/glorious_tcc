import 'dart:convert';
import 'package:crypto/crypto.dart';

class PasswordHasher {
  static String hash(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  static bool verify(String password, String hash) {
    return PasswordHasher.hash(password) == hash;
  }
}