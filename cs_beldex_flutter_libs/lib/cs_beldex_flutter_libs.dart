import 'package:cs_beldex_flutter_libs_platform_interface/cs_beldex_flutter_libs_platform_interface.dart';

class CsBeldexFlutterLibs {
  Future<String?> getPlatformVersion() {
    return CsBeldexFlutterLibsPlatform.instance.getPlatformVersion();
  }
}