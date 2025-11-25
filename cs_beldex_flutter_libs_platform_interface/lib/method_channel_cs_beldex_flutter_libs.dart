import 'package:flutter/services.dart';

import 'cs_beldex_flutter_libs_platform_interface.dart';

const _channel = MethodChannel('cs_beldex_flutter_libs');

class MethodChannelCsBeldexFlutterLibs extends CsBeldexFlutterLibsPlatform {
  @override
  Future<String?> getPlatformVersion() async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}