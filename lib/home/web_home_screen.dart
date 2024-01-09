import 'package:ezil_agency/common/widgets/custom_elevated_button.dart';
import 'package:ezil_agency/common/widgets/custom_grid_view.dart';
import 'package:ezil_agency/common/widgets/custom_outlined_button.dart';
import 'package:ezil_agency/common/widgets/custom_pack_item_tile.dart';
import 'package:ezil_agency/common/widgets/custom_project_cover.dart';
import 'package:ezil_agency/common/widgets/custom_service_tile.dart';
import 'package:ezil_agency/common/widgets/custom_text_anim_wave.dart';
import 'package:ezil_agency/home/home_controller.dart';
import 'package:ezil_agency/utils/constants/custom_animations_strings.dart';
import 'package:ezil_agency/utils/constants/custom_colors.dart';
import 'package:ezil_agency/utils/constants/custom_icon_strings.dart';
import 'package:ezil_agency/utils/constants/custom_sizes.dart';
import 'package:ezil_agency/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class WebHomeScreen extends Responsive {
  const WebHomeScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomSizes.SPACE_DEFAULT,
            ),
            child: Column(
              children: [
                /* ------------------------------------------ TOP BAR ------------------------------------------ */
                Row(
                  children: [
                    Image.asset(
                      isDark(context)
                          ? CustomIconStrings.APP_LOGO_LIGHT
                          : CustomIconStrings.APP_LOGO_DARK,
                      height: 80,
                      width: 200,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text("Home",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                            width: CustomSizes.SPACE_BETWEEN_SECTIONS),
                        Text("Services",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                            width: CustomSizes.SPACE_BETWEEN_SECTIONS),
                        Text("About us",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(
                            width: CustomSizes.SPACE_BETWEEN_SECTIONS),
                        Text("Projects",
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    const Spacer(),
                    CustomElevatedButton(
                      text: "Free consulting",
                      onClick: () {},
                      width: 150,
                      withDefaultPadding: false,
                    ),
                    const SizedBox(width: CustomSizes.SPACE_DEFAULT),
                    WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.pulse(
                            duration: const Duration(seconds: 5)),
                        child: Obx(
                          () => Switch(
                              value: controller.themeSwitcher.value,
                              activeColor: primaryColor(context),
                              autofocus: true,
                              focusColor:
                                  primaryColor(context).withOpacity(0.2),
                              inactiveThumbColor: primaryColor(context),
                              thumbIcon: MaterialStateProperty.all(Icon(
                                  Iconsax.moon,
                                  color: darkDarkLightLightColor(context))),
                              inactiveTrackColor:
                                  darkDarkLightLightColor(context),
                              onChanged: controller.onUpdateCurrentUpdateUi),
                        ))
                  ],
                ),

                /* ------------------------------------------ SPACER ------------------------------------------ */
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),

                /* ------------------------------------------ PADDING ------------------------------------------ */
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
                  child: Column(
                    children: [
                      /* ------------------------------------------ TITLE + ANIMATION ------------------------------------------ */
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Développer Vos Ventes Facilement',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(fontSize: 60)),
                                const SizedBox(
                                    height:
                                        CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                Text(
                                    "Notre objectif est de conquérir nos clients, de les fidéliser et d'en faire des ambassadeurs.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(fontSize: 20)),
                                const SizedBox(
                                    height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                                WidgetAnimator(
                                    atRestEffect: WidgetRestingEffects.size(
                                        duration: const Duration(seconds: 3)),
                                    child: CustomElevatedButton(
                                      text: "Get started",
                                      onClick: () {},
                                      width: 150,
                                      withDefaultPadding: false,
                                    )),
                              ],
                            ),
                          ),

                          /* ------------------------------------------ ANIMATION ------------------------------------------ */
                          Expanded(
                            child: LottieBuilder.asset(
                              CustomAnimationStrings.CODING,
                              width: 350,
                              height: 350,
                              repeat: true,
                            ),
                          ),
                        ],
                      ),

                      /* ------------------------------------------ OUR SERVICES ------------------------------------------ */
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      Text("Our services",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: CustomColors.PRIMARY_LIGHT)),

                      /* ------------------------------------------ SPACER ------------------------------------------ */
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                      Text("Transformative Digital offerings",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(fontSize: 40)),

                      /* ------------------------------------------ SPACER ------------------------------------------ */
                      const SizedBox(
                          height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                      /* ------------------------------------------ DIGITAL OFFERS ------------------------------------------ */
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: CustomServiceTile(
                                  image: "assets/icons/app_dev.png",
                                  title: "MOBILE APP",
                                  description:
                                      "Fueling innovation in the palm of your hand, we are your mobile app experts. From concept to deployment, our agency specializes in crafting sleek and user-friendly mobile applications. Elevate your brand's mobile experience with us.")),
                          SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Expanded(
                              child: CustomServiceTile(
                                  image: "assets/icons/web_site_dev.png",
                                  title: "WEB SITE",
                                  description:
                                      "Transform your vision into a compelling online presence with our web design agency. We specialize in creating stunning, user-friendly websites that captivate and engage. Elevate your brand online with our expert team.")),
                          SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Expanded(
                              child: CustomServiceTile(
                                  image: "assets/icons/web_app_dev.png",
                                  title: "APPLICATION WEB",
                                  description:
                                      "Empower your business with our bespoke web apps. We specialize in crafting seamless and user-friendly web apps, innovative solutions for a dynamic online presence. Elevate your digital strategy with our agency.")),
                          SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Expanded(
                              child: CustomServiceTile(
                                  image: "assets/icons/advertising_dev.png",
                                  title: "MARKETING DIGITAL",
                                  description:
                                      "Amplify your brand's reach with our advertising expertise. As a dynamic agency, we specialize in crafting impactful campaigns that resonate across diverse platforms. Elevate your brand visibility and engagement")),
                        ],
                      ),

                      /* ------------------------------------------ SPACER ------------------------------------------ */
                      const SizedBox(
                          height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
                    ],
                  ),
                ),

                /* ------------------------------------------ SOME INFO ------------------------------------------ */
                Container(
                  width: getWidth(context),
                  padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
                  decoration: BoxDecoration(
                      color: primaryColor(context),
                      border:
                          Border.all(width: 0.5, color: CustomColors.GREY_DARK),
                      borderRadius: BorderRadius.circular(
                          CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                  child: Column(
                    children: [
                      Text("Transformative Digital offerings",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontSize: 40, color: CustomColors.WHITE)),
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      const Row(
                        children: [
                          Expanded(
                            child: CustomTextAnimWave(
                                title: "11+", subTitle: "Projects"),
                          ),
                          Expanded(
                            child: CustomTextAnimWave(
                                title: "999+",
                                subTitle: "Potential customers this year"),
                          ),
                          Expanded(
                            child: CustomTextAnimWave(
                                title: "4.7/5", subTitle: "Custom rating"),
                          ),
                          Expanded(
                            child: CustomTextAnimWave(
                                title: "2023", subTitle: "Year of creation"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /* ------------------------------------------ SPACER ------------------------------------------ */
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),

                /* ------------------------------------------ GRID VIEW ------------------------------------------ */
                Text("Notre Projects Digital",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 40)),

                /* ------------------------------------------ SPACER ------------------------------------------ */
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                /* ------------------------------------------ GRID VIEW ------------------------------------------ */
                Text(
                    "Notre équipe vous accompagne et assure un suivi client de qualité.",
                    style: Theme.of(context).textTheme.titleMedium),

                /* ------------------------------------------ SPACER ------------------------------------------ */
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),

                /* ------------------------------------------ GRID VIEW ------------------------------------------ */
                CustomGridView(
                    itemsInRow: 4,
                    spaceBetweenRows: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                    spaceBetweenColumns: CustomSizes.SPACE_BETWEEN_SECTIONS * 2,
                    itemsHeight: 300,
                    count: controller.projectsBackground.length,
                    itemBuilder: (BuildContext context, int index) => Obx(
                          () => CustomProjectCover(
                              onClick: () {},
                              onHover: (hover, img) {
                                controller.onUpdateHoverState(hover);
                                controller.currentHoverItem.value = img;
                              },
                              image: controller.projectsBackground[index],
                              child: controller.projectsBackground[index] ==
                                      controller.currentHoverItem.value
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: grayColor(context)
                                              .withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(
                                              CustomSizes.SPACE_DEFAULT)),
                                      child: Center(
                                          child: TextAnimator("See more ...",
                                              atRestEffect:
                                                  WidgetRestingEffects.wave(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                      color:
                                                          CustomColors.WHITE))),
                                    )
                                  : const Placeholder(
                                      color: Colors.transparent,
                                    )),
                        )),

                /* ------------------------------------------ SPACER ------------------------------------------ */
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
                Text("Price Plan",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: primaryColor(context))),
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                Text("Creative Solutions, Transparent Pricing",
                    style: Theme.of(context).textTheme.headlineLarge),

                /* ------------------------------------------ SPACER ------------------------------------------ */
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                /* ------------------------------------------ PACKAGES ------------------------------------------ */
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: CustomSizes.SPACE_DEFAULT),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS,
                              vertical: CustomSizes.SPACE_DEFAULT),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: darkLightColor(context)),
                              borderRadius: BorderRadius.circular(
                                  CustomSizes.SPACE_DEFAULT)),
                          child: Column(
                            children: [
                              Text("Basic plan",
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS),
                              Text("499 Dh / mois",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS),
                              Divider(color: grayColor(context)),
                              const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                              WidgetAnimator(
                                  atRestEffect: WidgetRestingEffects.wave(),
                                  child: CustomOutlinedButton(
                                      text: "SELECT PLAN",
                                      onClick: () {},
                                      width: 200,
                                      withDefaultPadding: false))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS,
                              vertical: CustomSizes.SPACE_DEFAULT),
                          decoration: BoxDecoration(
                              color: primaryColor(context),
                              border: Border.all(color: primaryColor(context)),
                              borderRadius: BorderRadius.circular(
                                  CustomSizes.SPACE_DEFAULT)),
                          child: Column(
                            children: [
                              Text("Basic plan",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(color: CustomColors.WHITE)),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS),
                              Text("499 Dh / mois",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(color: CustomColors.WHITE)),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS),
                              Divider(color: grayColor(context)),
                              const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                              const CustomPackItemTile(
                                  title: "Email professional",
                                  color: CustomColors.WHITE),
                              const CustomPackItemTile(
                                  title: "Email professional",
                                  color: CustomColors.WHITE),
                              const CustomPackItemTile(
                                  title: "Email professional",
                                  color: CustomColors.WHITE),
                              const CustomPackItemTile(
                                  title: "Email professional",
                                  color: CustomColors.WHITE),
                              const CustomPackItemTile(
                                  title: "Email professional",
                                  color: CustomColors.WHITE),
                              const CustomPackItemTile(
                                  title: "Email professional",
                                  color: CustomColors.WHITE),
                              const CustomPackItemTile(
                                  title: "Email professional",
                                  color: CustomColors.WHITE),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                              WidgetAnimator(
                                  atRestEffect: WidgetRestingEffects.bounce(),
                                  child: CustomElevatedButton(
                                      text: "SELECT PLAN",
                                      onClick: () {},
                                      width: 200,
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: CustomColors.WHITE,
                                          foregroundColor:
                                              primaryColor(context))))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: CustomSizes.SPACE_BETWEEN_ITEMS,
                              vertical: CustomSizes.SPACE_DEFAULT),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: darkLightColor(context)),
                              borderRadius: BorderRadius.circular(
                                  CustomSizes.SPACE_DEFAULT)),
                          child: Column(
                            children: [
                              Text("Basic plan",
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS),
                              Text("499 Dh / mois",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS),
                              Divider(color: grayColor(context)),
                              const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const CustomPackItemTile(
                                  title: "Email professional"),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                              WidgetAnimator(
                                  atRestEffect: WidgetRestingEffects.wave(),
                                  child: CustomOutlinedButton(
                                      text: "SELECT PLAN",
                                      onClick: () {},
                                      width: 200,
                                      withDefaultPadding: false))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /* ------------------------------------------ SPACER ------------------------------------------ */
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
                Text("Languages",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 60)),
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Text("Technologies we are using for development",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20)),
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                /* ------------------------------------------ SPACER ------------------------------------------ */
                const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                /* ------------------------------------------ PROGRAMMING LANGUAGES ------------------------------------------ */
                Row(
                  children: [
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/flutter_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/java_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/kotlin_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/react_native_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/android_studio_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/swift_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/vs_code_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/firebase_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/figma_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/xcode_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/html_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/css_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/python_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/django_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/php_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/laravel_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                    Expanded(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.size(
                            duration: const Duration(seconds: 3)),
                        child: Image.asset(
                            "assets/icons/languages/database_icon.png",
                            height: 60,
                            width: 60,
                            color: grayColor(context)),
                      ),
                    ),
                  ],
                ),

                /* ------------------------------------------ SPACER ------------------------------------------ */
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              ],
            )),
      ),
      /* ------------------------------------------ FLOATING ACTION BUTTON ------------------------------------------ */
      floatingActionButton: Obx(
        () => AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: controller.showFloatingActionButton.value ? 1.0 : 0.0,
          child: FloatingActionButton(
            onPressed: () {
              controller.scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastOutSlowIn);
            },
            elevation: 16.0,
            backgroundColor: primaryColor(context),
            child: const Icon(Iconsax.arrow_up_24, color: CustomColors.WHITE),
          ),
        ),
      ),
    );
  }
}
