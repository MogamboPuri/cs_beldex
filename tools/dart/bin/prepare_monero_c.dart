import 'dart:io';

import '../env.dart';
import '../util.dart';

void main() async {
  await createBuildDirs();

  final moneroCDir = Directory(envMoneroCDir);
  if (moneroCDir.existsSync()) {
    // TODO: something?
    l("monero_c dir already exists");
    return;
  } else {
    /*
    // Change directory to BUILD_DIR
    Directory.current = envBuildDir;

    // Clone the monero_c repository
    await runAsync('git', [
      'clone',
      kMoneroCRepo,
    ]);

    // Change directory to MONERO_C_DIR
    Directory.current = moneroCDir;

    // Checkout specific commit and reset
    await runAsync('git', ['checkout', kMoneroCHash]);
    await runAsync('git', ['reset', '--hard']);
    */

    // Source directory (local monero_c)
    final localMoneroCPath = '${envProjectDir}/../monero_c';
    final localMoneroC = Directory(localMoneroCPath);

    if (!localMoneroC.existsSync()) {
      l('Error: Local monero_c directory not found at $localMoneroCPath');
      exit(1);
    }

    // Create parent build dir if missing
    Directory(envBuildDir).createSync(recursive: true);

    // Copy monero_c from local to build dir
    l('Copying local monero_c from $localMoneroCPath to $envBuildDir ...');
    await runAsync('cp', ['-r', localMoneroCPath, envBuildDir]);

    // Change directory to monero_c
    Directory.current = moneroCDir;

    // Update submodules
    await runAsync(
      'git',
      ['submodule', 'update', '--init', '--force', '--recursive'],
    );

    // Apply patches
    await runAsync('./apply_patches.sh', ['beldex']);

    // Apply AV patches to monero_c.
    /* final moneroAVPatchPath = '$envProjectDir/patches/fix-monero-av.patch';
    l('Applying fix-monero-av.patch to monero_c...');
    await runAsync('git', [
      'apply',
      '--whitespace=nowarn',
      moneroAVPatchPath,
    ]); */
  }
}
