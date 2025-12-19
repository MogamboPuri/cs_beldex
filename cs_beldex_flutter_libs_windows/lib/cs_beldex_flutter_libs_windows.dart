import 'package:cs_beldex_flutter_libs_platform_interface/cs_beldex_flutter_libs_platform_interface.dart';
import 'package:flutter/services.dart';

const _channel = MethodChannel('cs_beldex_flutter_libs_windows');

class CsBeldexFlutterLibsWindows extends CsBeldexFlutterLibsPlatform {
  /// Registers this class as the default instance of [CsBeldexFlutterLibsPlatform].
  static void registerWith() {
    CsBeldexFlutterLibsPlatform.instance = CsBeldexFlutterLibsWindows();
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
