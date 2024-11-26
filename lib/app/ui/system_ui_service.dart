import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUIService {
  static void _setSystemUIOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        systemStatusBarContrastEnforced: false,
      ),
    );
  }

  static Future<void> _edgeToEdge() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  static Future<void> initSystemUI() async {
    await _edgeToEdge();
    _setSystemUIOverlayStyle();
  }

  static Future<void> init() async {
    await SystemUIService.initSystemUI();
  }
}
