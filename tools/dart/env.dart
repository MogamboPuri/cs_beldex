import 'dart:io';

const kMoneroCRepo = "https://github.com/MogamboPuri/monero_c";
const kMoneroCHash = "985d0b0521e9bdc6b40db91691271f627bbd2f93";

final envProjectDir =
    File.fromUri(Platform.script).parent.parent.parent.parent.path;

String get envToolsDir => "$envProjectDir${Platform.pathSeparator}tools";
String get envBuildDir => "$envProjectDir${Platform.pathSeparator}build";
String get envMoneroCDir => "$envBuildDir${Platform.pathSeparator}monero_c";
String get envOutputsDir =>
    "$envProjectDir${Platform.pathSeparator}built_outputs";