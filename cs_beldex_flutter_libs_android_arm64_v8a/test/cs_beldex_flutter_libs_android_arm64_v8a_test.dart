import 'package:cs_beldex_flutter_libs_android_arm64_v8a/cs_beldex_flutter_libs_android_arm64_v8a.dart';
import 'package:cs_beldex_flutter_libs_android_arm64_v8a/cs_beldex_flutter_libs_android_arm64_v8a_method_channel.dart';
import 'package:cs_beldex_flutter_libs_android_arm64_v8a/cs_beldex_flutter_libs_android_arm64_v8a_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCsBeldexFlutterLibsAndroidArm64V8aPlatform
    with MockPlatformInterfaceMixin
    implements CsBeldexFlutterLibsAndroidArm64V8aPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CsBeldexFlutterLibsAndroidArm64V8aPlatform initialPlatform =
      CsBeldexFlutterLibsAndroidArm64V8aPlatform.instance;

  test(
      '$MethodChannelCsBeldexFlutterLibsAndroidArm64V8a is the default instance',
      () {
    expect(
      initialPlatform,
      isInstanceOf<MethodChannelCsBeldexFlutterLibsAndroidArm64V8a>(),
    );
  });

  test('getPlatformVersion', () async {
    final csBeldexFlutterLibsAndroidArm64V8aPlugin =
        CsBeldexFlutterLibsAndroidArm64V8a();
    final fakePlatform = MockCsBeldexFlutterLibsAndroidArm64V8aPlatform();
    CsBeldexFlutterLibsAndroidArm64V8aPlatform.instance = fakePlatform;

    expect(
      await csBeldexFlutterLibsAndroidArm64V8aPlugin.getPlatformVersion(),
      '42',
    );
  });
}
