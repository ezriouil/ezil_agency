import 'package:ezil_agency/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';

class CustomPackItemTile extends Responsive {
  final String title;
  final Color? color;

  const CustomPackItemTile({super.key, required this.title, this.color});

  @override
  Widget execute(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.done_all_outlined,
            size: 20, color: color ??primaryColor(context)),
        contentPadding: EdgeInsets.zero,
        dense: true,
        minVerticalPadding: 0,
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color ?? darkLightColor(context))));
  }
}
/*
 Row(children: [Icon(Icons.done_all_outlined,
        size: 20, color: primaryColor(context)), Text(title, style: Theme.of(context).textTheme.bodyLarge)],)
 */
