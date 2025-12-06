import 'package:cs_beldex_flutter_libs_android_armeabi_v7a/cs_beldex_flutter_libs_android_armeabi_v7a.dart';
import 'package:cs_beldex_flutter_libs_android_armeabi_v7a/cs_beldex_flutter_libs_android_armeabi_v7a_method_channel.dart';
import 'package:cs_beldex_flutter_libs_android_armeabi_v7a/cs_beldex_flutter_libs_android_armeabi_v7a_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCsBeldexFlutterLibsAndroidArmeabiV7aPlatform
    with MockPlatformInterfaceMixin
    implements CsBeldexFlutterLibsAndroidArmeabiV7aPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CsBeldexFlutterLibsAndroidArmeabiV7aPlatform initialPlatform =
      CsBeldexFlutterLibsAndroidArmeabiV7aPlatform.instance;

  test(
      '$MethodChannelCsBeldexFlutterLibsAndroidArmeabiV7a is the default instance',
      () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelCsBeldexFlutterLibsAndroidArmeabiV7a>(),
    );
  });

  test('getPlatformVersion', () async {
    final csBeldexFlutterLibsAndroidArmeabiV7aPlugin =
        CsBeldexFlutterLibsAndroidArmeabiV7a();
    final fakePlatform = MockCsBeldexFlutterLibsAndroidArmeabiV7aPlatform();
    CsBeldexFlutterLibsAndroidArmeabiV7aPlatform.instance = fakePlatform;

    expect(
      await csBeldexFlutterLibsAndroidArmeabiV7aPlugin.getPlatformVersion(),
      '42',
    );
  });
}
