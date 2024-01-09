import 'package:ezil_agency/utils/constants/custom_sizes.dart';
import 'package:ezil_agency/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends Responsive {
  final String text;
  final GestureTapCallback onClick;
  final double? width, height;
  final bool withDefaultPadding;
  final ButtonStyle? style;

  const CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onClick,
        this.width,
        this.height,
      this.style,
      this.withDefaultPadding = true});

  @override
  Widget execute(BuildContext context) {
    return SizedBox(
        width: width ?? getWidth(context),
        height: height ?? 70,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  withDefaultPadding ? CustomSizes.SPACE_BETWEEN_ITEMS / 2 : 0,
              vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          child: ElevatedButton(
            onPressed: () => onClick(),
            style: style,
            child: Text(text),
          ),
        ));
  }
}
