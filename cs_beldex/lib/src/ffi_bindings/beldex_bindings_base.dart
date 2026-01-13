import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import 'generated_bindings_beldex.g.dart';

String get _libName {
  if (Platform.isIOS || Platform.isMacOS) {
    return 'BeldexWallet.framework/BeldexWallet';
  } else if (Platform.isAndroid) {
    return 'libbeldex_libwallet2_api_c.so';
  } else if (Platform.isWindows) {
    return 'beldex_libwallet2_api_c.dll';
  } else if (Platform.isLinux) {
    return 'beldex_libwallet2_api_c.so';
  } else {
    throw UnsupportedError(
      "Platform \"${Platform.operatingSystem}\" is not supported",
    );
  }
}

FfiBeldexC? _cachedBindings;
FfiBeldexC get bindings => _cachedBindings ??= FfiBeldexC(
      DynamicLibrary.open(
        _libName,
      ),
    );

final defaultSeparatorStr = ";";
final defaultSeparator = defaultSeparatorStr.toNativeUtf8().cast<Char>();

String convertAndFree(Pointer<Utf8> stringPointer) {
  final value = stringPointer.toDartString();
  bindings.BELDEX_free(stringPointer.cast());
  return value;
}
