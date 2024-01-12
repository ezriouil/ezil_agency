import 'package:ezil_agency/home/screens/mobile_home_screen.dart';
import 'package:ezil_agency/home/screens/tablet_home_screen.dart';
import 'package:ezil_agency/home/screens/web_home_screen.dart';
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

//flutter pub run flutter_native_splash:remove
//flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml