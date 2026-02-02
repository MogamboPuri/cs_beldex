import 'dart:io';

const kMoneroCRepo = "https://github.com/MogamboPuri/monero_c";
const kMoneroCHash = "c4efe393e9c6f7928a6a07e007ff15dfc01238ef";

final envProjectDir =
    File.fromUri(Platform.script).parent.parent.parent.parent.path;

String get envToolsDir => "$envProjectDir${Platform.pathSeparator}tools";
String get envBuildDir => "$envProjectDir${Platform.pathSeparator}build";
String get envMoneroCDir => "$envBuildDir${Platform.pathSeparator}monero_c";
String get envOutputsDir =>
    "$envProjectDir${Platform.pathSeparator}built_outputs";