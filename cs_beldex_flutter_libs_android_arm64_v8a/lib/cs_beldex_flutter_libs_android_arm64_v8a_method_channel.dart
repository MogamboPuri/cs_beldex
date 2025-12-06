import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cs_beldex_flutter_libs_android_arm64_v8a_platform_interface.dart';

/// An implementation of [CsBeldexFlutterLibsAndroidArm64V8aPlatform] that uses method channels.
class MethodChannelCsBeldexFlutterLibsAndroidArm64V8a extends CsBeldexFlutterLibsAndroidArm64V8aPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cs_beldex_flutter_libs_android_arm64_v8a');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
