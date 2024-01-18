import 'package:flutter/material.dart';
import 'package:ezil_agency/utils/responsive/responsive.dart';

class ResponsiveLayout extends Responsive {
  final Widget mobileTablet;
  final Widget web;

  const ResponsiveLayout({
    super.key,
    required this.web,
    required this.mobileTablet,
  });

  @override
  Widget execute(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
     if(constraints.maxWidth >= 1100) {
       return web;
     } else {
       return mobileTablet;
     }
    });
  }
}
