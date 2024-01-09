import 'package:ezil_agency/common/widgets/custom_text_field.dart';
import 'package:ezil_agency/utils/constants/custom_sizes.dart';
import 'package:ezil_agency/utils/constants/custom_txt_strings.dart';
import 'package:ezil_agency/utils/extensions/validator.dart';
import 'package:ezil_agency/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MobileHomeScreen extends Responsive {
  const MobileHomeScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //

    return const Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT, vertical: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("data")
              ],
            )
          ),
        )
    );
  }
}