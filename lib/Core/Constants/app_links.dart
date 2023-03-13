import 'package:flutter/foundation.dart';

class AppLinks {
  static const String _webIp = '127.0.0.1';
  static const String _mobileIp = '192.168.1.7';
  static const String _ip = kIsWeb ? _webIp : _mobileIp;
  static const String _port = '8080';
  static const String base = 'http://$_ip:$_port/api/v1';
  static const String wisdoms = '$base/wisdoms';
  static const String wisdom = '$base/wisdoms/wisdom';
}
