import 'package:cs_beldex_flutter_libs_android_arm64_v8a/cs_beldex_flutter_libs_android_arm64_v8a.dart';
import 'package:cs_beldex_flutter_libs_android_armeabi_v7a/cs_beldex_flutter_libs_android_armeabi_v7a.dart';
import 'package:cs_beldex_flutter_libs_android_x86_64/cs_beldex_flutter_libs_android_x86_64.dart';
import 'package:cs_beldex_flutter_libs_platform_interface/cs_beldex_flutter_libs_platform_interface.dart';
import 'package:flutter/services.dart';

const _channel = MethodChannel('cs_beldex_flutter_libs_android');

class CsBeldexFlutterLibsAndroid extends CsBeldexFlutterLibsPlatform {
  /// Registers this class as the default instance of [CsBeldexFlutterLibsPlatform].
  static void registerWith() {
    CsBeldexFlutterLibsPlatform.instance = CsBeldexFlutterLibsAndroid();
  }

  @override
  Future<String?> getPlatformVersion({
    bool overrideForBasicTestCoverageTesting = false,
  }) async {
    if (!overrideForBasicTestCoverageTesting) {
      // make calls so flutter doesn't tree shake
      await Future.wait([
        CsBeldexFlutterLibsAndroidArm64V8a().getPlatformVersion(),
        CsBeldexFlutterLibsAndroidArmeabiV7a().getPlatformVersion(),
        CsBeldexFlutterLibsAndroidX8664().getPlatformVersion(),
      ]);
    }

    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
