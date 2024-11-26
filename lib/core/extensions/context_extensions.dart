import 'package:flutter/material.dart';

extension ContextExt on BuildContext {

  // Theme checks
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get theme => Theme.of(this);

  // Size checks
  Size get size => MediaQuery.sizeOf(this);

  double get width => size.width;

  double get height => size.height;

  double get topPadding => MediaQuery.paddingOf(this).top;

  double get bottomPadding => MediaQuery.paddingOf(this).bottom;

  double get statusBarHeight => MediaQuery.of(this).viewPadding.top; 

  double get bottomBarHeight => MediaQuery.of(this).viewPadding.bottom;

  // Boolean checks
  bool get isPortrait => size.height > size.width;

  bool get isLandscape => size.width > size.height;

  bool get isDarkMode => colorScheme.brightness == Brightness.dark;

  bool get isMobile => width < 600;

  bool get isTablet => width >= 600 && width < 900;

  bool get isLargeTablet => width >= 900 && width < 1200;

  bool get isDesktop => width >= 1200 && width < 1440;

  bool get isLargeDesktop => width >= 1440;
}
