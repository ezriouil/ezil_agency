import 'package:ezil_agency/home/screens/mobile_tablet_home_screen.dart';
import 'package:ezil_agency/home/screens/web_home_screen.dart';
import 'package:ezil_agency/utils/responsive/responsive.dart';
import 'package:ezil_agency/utils/responsive/responsive_layout.dart';
import 'package:ezil_agency/utils/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const Flutter());
}

class Flutter extends Responsive {
  const Flutter({super.key});

  @override
  Widget execute(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeApp.lightTheme,
        darkTheme: ThemeApp.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const ResponsiveLayout(
          web: WebHomeScreen(),
          mobileTablet: MobileTabletHomeScreen(),
        ));
  }
}
