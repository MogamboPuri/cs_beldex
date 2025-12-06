import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cs_beldex_flutter_libs_android_x86_64_platform_interface.dart';

/// An implementation of [CsBeldexFlutterLibsAndroidX8664Platform] that uses method channels.
class MethodChannelCsBeldexFlutterLibsAndroidX8664 extends CsBeldexFlutterLibsAndroidX8664Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cs_beldex_flutter_libs_android_x86_64');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
