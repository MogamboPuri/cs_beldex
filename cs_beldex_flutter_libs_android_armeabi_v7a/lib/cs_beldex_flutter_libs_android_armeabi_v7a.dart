
import 'cs_beldex_flutter_libs_android_armeabi_v7a_platform_interface.dart';

class CsBeldexFlutterLibsAndroidArmeabiV7a {
  Future<String?> getPlatformVersion() {
    return CsBeldexFlutterLibsAndroidArmeabiV7aPlatform.instance.getPlatformVersion();
  }
}
