import 'package:cs_beldex_flutter_libs_ios/cs_beldex_flutter_libs_ios.dart';
import 'package:cs_beldex_flutter_libs_platform_interface/cs_beldex_flutter_libs_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("$CsBeldexFlutterLibsIos", () {
    final platform = CsBeldexFlutterLibsIos();
    const MethodChannel channel = MethodChannel("cs_beldex_flutter_libs_ios");

    setUp(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        channel,
        (MethodCall methodCall) async {
          return "42";
        },
      );
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    test("getPlatformVersion", () async {
      expect(await platform.getPlatformVersion(), "42");
    });
  });

  test("registerWith", () {
    CsBeldexFlutterLibsIos.registerWith();
    expect(
      CsBeldexFlutterLibsPlatform.instance,
      isA<CsBeldexFlutterLibsIos>(),
    );
  });
}
