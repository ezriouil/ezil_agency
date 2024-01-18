import 'package:ezil_agency/utils/constants/custom_colors.dart';
import 'package:ezil_agency/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

abstract class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
    isDark(context);
    darkLightColor(context);
    primaryColor(context);
    return execute(context);
  }

  /// BUILD METHODE
  Widget execute(BuildContext context);

  /// INFO
  double getWidth(BuildContext context) =>
      DeviceUtility.getDeviceWidth(context);

  double getHeight(BuildContext context) =>
      DeviceUtility.getDeviceHeight(context);

  bool isDark(BuildContext context) => DeviceUtility.isDark(context);

  Color grayColor(BuildContext context) => CustomColors.GREY_DARK;

  Color darkLightColor(BuildContext context) {
    return isDark(context) ? CustomColors.WHITE : CustomColors.BLACK;
  }

  Color darkDarkLightLightColor(BuildContext context) {
    return isDark(context) ? CustomColors.BLACK : CustomColors.WHITE;
  }

  Color yellowColor(BuildContext context) {
    return isDark(context)
        ? CustomColors.YELLOW_DARK
        : CustomColors.YELLOW_LIGHT;
  }

  Color primaryColor(BuildContext context) {
    return isDark(context)
        ? CustomColors.PRIMARY_LIGHT
        : CustomColors.PRIMARY_DARK;
  }

  double spaceBetweenItems({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        return 16.0;
      case DeviceType.TABLE:
        return 32.0;
      case DeviceType.WEB:
        return 48.0;
    }
  }

  double spaceDefault({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        return 24.0;
      case DeviceType.TABLE:
        return 48.0;
      case DeviceType.WEB:
        return 72.0;
    }
  }

  double spaceBetweenSections({required DeviceType deviceType}) {
    switch (deviceType) {
      case DeviceType.MOBILE:
        return 32.0;
      case DeviceType.TABLE:
        return 64.0;
      case DeviceType.WEB:
        return 96.0;
    }
  }
}
