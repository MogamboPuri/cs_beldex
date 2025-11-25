import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_cs_beldex_flutter_libs.dart';

abstract class CsBeldexFlutterLibsPlatform extends PlatformInterface {
  /// Constructs a CsBeldexFlutterLibsPlatformInterfacePlatform.
  CsBeldexFlutterLibsPlatform() : super(token: _token);

  static final Object _token = Object();

  static CsBeldexFlutterLibsPlatform _instance =
      MethodChannelCsBeldexFlutterLibs();

  /// The default instance of [CsBeldexFlutterLibsPlatform] to use.
  ///
  /// Defaults to [MethodChannelCsBeldexFlutterLibs].
  static CsBeldexFlutterLibsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CsBeldexFlutterLibsPlatform] when
  /// they register themselves.
  static set instance(CsBeldexFlutterLibsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();
}