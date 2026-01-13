import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'cs_beldex_flutter_libs_android_armeabi_v7a_method_channel.dart';

abstract class CsBeldexFlutterLibsAndroidArmeabiV7aPlatform
    extends PlatformInterface {
  /// Constructs a CsBeldexFlutterLibsAndroidArmeabiV7aPlatform.
  CsBeldexFlutterLibsAndroidArmeabiV7aPlatform() : super(token: _token);

  static final Object _token = Object();

  static CsBeldexFlutterLibsAndroidArmeabiV7aPlatform _instance =
      MethodChannelCsBeldexFlutterLibsAndroidArmeabiV7a();

  /// The default instance of [CsBeldexFlutterLibsAndroidArmeabiV7aPlatform] to use.
  ///
  /// Defaults to [MethodChannelCsBeldexFlutterLibsAndroidArmeabiV7a].
  static CsBeldexFlutterLibsAndroidArmeabiV7aPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CsBeldexFlutterLibsAndroidArmeabiV7aPlatform] when
  /// they register themselves.
  static set instance(CsBeldexFlutterLibsAndroidArmeabiV7aPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
