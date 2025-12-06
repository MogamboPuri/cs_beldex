import 'package:cs_beldex_flutter_libs_android_x86_64/cs_beldex_flutter_libs_android_x86_64.dart';
import 'package:cs_beldex_flutter_libs_android_x86_64/cs_beldex_flutter_libs_android_x86_64_method_channel.dart';
import 'package:cs_beldex_flutter_libs_android_x86_64/cs_beldexflutter_libs_android_x86_64_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCsBeldexFlutterLibsAndroidX8664Platform
    with MockPlatformInterfaceMixin
    implements CsBeldexFlutterLibsAndroidX8664Platform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CsBeldexFlutterLibsAndroidX8664Platform initialPlatform =
      CsBeldexFlutterLibsAndroidX8664Platform.instance;

  test('$MethodChannelCsBeldexFlutterLibsAndroidX8664 is the default instance',
      () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelCsBeldexFlutterLibsAndroidX8664>(),
    );
  });

  test('getPlatformVersion', () async {
    final csBeldexFlutterLibsAndroidX8664Plugin =
        CsBeldexFlutterLibsAndroidX8664();
    final fakePlatform = MockCsBeldexFlutterLibsAndroidX8664Platform();
    CsBeldexFlutterLibsAndroidX8664Platform.instance = fakePlatform;

    expect(
      await csBeldexFlutterLibsAndroidX8664Plugin.getPlatformVersion(),
      '42',
    );
  });
}
