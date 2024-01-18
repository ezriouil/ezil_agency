import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceUtility {
  DeviceUtility._();

  /// THEME MODE DARK OR LIGHT
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  /// DEVICE ORIENTATION
  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandScape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  /// DEVICE SIZE
  static double getDeviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double getDeviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static bool isMobile(BuildContext context) => context.isPhone;
  static bool isTablet(BuildContext context) => context.isTablet;

  /// PLATFORM TYPES
  static bool isAndroid() => Platform.isAndroid;

  static bool isIos() => Platform.isIOS;

  static bool isWeb() => kIsWeb;
}

enum DeviceType { MOBILE, TABLE, WEB }
