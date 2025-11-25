# `cs_beldex_flutter_libs_platform_interface`
A common platform interface for the 
[`cs_beldex`](https://pub.dev/packages/cs_beldex) plugin.

# Usage
To implement a new platform-specific implementation of `cs_beldex`, extend 
`CsBeldexFlutterLibsPlatform` with an implementation that performs the 
platform-specific behavior, and when you register your plugin, set the default 
`CsBeldexFlutterLibsPlatform` by calling 
`CsBeldexFlutterLibsPlatform.instance = CsBeldexFlutterLibsPlatform()`.