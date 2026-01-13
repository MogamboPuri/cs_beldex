import 'cs_beldex_flutter_libs_android_arm64_v8a_platform_interface.dart';

class CsBeldexFlutterLibsAndroidArm64V8a {
  Future<String?> getPlatformVersion() {
    return CsBeldexFlutterLibsAndroidArm64V8aPlatform.instance
        .getPlatformVersion();
  }
}
