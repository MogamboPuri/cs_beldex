import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cs_beldex_flutter_libs_android_armeabi_v7a_platform_interface.dart';

/// An implementation of [CsBeldexFlutterLibsAndroidArmeabiV7aPlatform] that uses method channels.
class MethodChannelCsBeldexFlutterLibsAndroidArmeabiV7a
    extends CsBeldexFlutterLibsAndroidArmeabiV7aPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel =
      const MethodChannel('cs_beldex_flutter_libs_android_armeabi_v7a');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
