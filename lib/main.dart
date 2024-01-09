import 'package:ezil_agency/home/mobile_home_screen.dart';
import 'package:ezil_agency/home/tablet_home_screen.dart';
import 'package:ezil_agency/home/web_home_screen.dart';
import 'package:ezil_agency/utils/responsive/responsive_layout.dart';
import 'package:ezil_agency/utils/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const ResponsiveLayout(
          mobile: MobileHomeScreen(),
          tablet: TabletHomeScreen(),
          web: WebHomeScreen())));
}
