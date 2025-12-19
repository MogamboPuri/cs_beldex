#include "include/cs_beldex_flutter_libs_windows/cs_beldex_flutter_libs_windows_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "cs_beldex_flutter_libs_windows_plugin.h"

void CsBeldexFlutterLibsWindowsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  cs_beldex_flutter_libs_windows::CsBeldexFlutterLibsWindowsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
