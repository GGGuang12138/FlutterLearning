import 'dart:convert';

import 'package:crypto/crypto.dart';
//SHA256加密
String encrypt(String input){
  String salt = "Jxo123xxxbabad1mmn1caibutou";//加盐
  var bytes = utf8.encode(input+salt);
  var digest = sha256.convert(bytes);
  return digest.toString();
}