import 'package:ezil_agency/common/widgets/custom_elevated_button.dart';
import 'package:ezil_agency/common/widgets/custom_grid_view.dart';
import 'package:ezil_agency/common/widgets/custom_outlined_button.dart';
import 'package:ezil_agency/common/widgets/custom_pack_item_tile.dart';
import 'package:ezil_agency/common/widgets/custom_project_cover.dart';
import 'package:ezil_agency/common/widgets/custom_service_item.dart';
import 'package:ezil_agency/common/widgets/custom_service_tile.dart';
import 'package:ezil_agency/common/widgets/custom_text_anim_wave.dart';
import 'package:ezil_agency/home/home_controller.dart';
import 'package:ezil_agency/utils/constants/custom_animations_strings.dart';
import 'package:ezil_agency/utils/constants/custom_colors.dart';
import 'package:ezil_agency/utils/constants/custom_icon_strings.dart';
import 'package:ezil_agency/utils/constants/custom_sizes.dart';
import 'package:ezil_agency/utils/constants/custom_txt_strings.dart';
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
                    Text(CustomTextStrings.HOME,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS),
                    InkWell(
                      onTap: controller.onNavigateToServiceScreen,
                      child: Text(CustomTextStrings.SERVICES,
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS),
                    InkWell(
                      onTap: controller.onNavigateToAboutUsScreen,
                      child: Text(CustomTextStrings.ABOUT_US,
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS),
                    InkWell(
                      onTap: controller.onNavigateToProjectsScreen,
                      child: Text(CustomTextStrings.PROJECTS,
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                  ],
                ),
                const Spacer(),
                CustomElevatedButton(
                  text: CustomTextStrings.CONTACT_US,
                  onClick: ()=>controller.onNavigateToContactUsScreen(context),
                  width: 120,
                  withDefaultPadding: false,
                ),
                const SizedBox(width: CustomSizes.SPACE_DEFAULT),
                WidgetAnimator(
                    atRestEffect: WidgetRestingEffects.pulse(
                        duration: const Duration(seconds: 6)),
                    child: Obx(
                      () => Switch(
                          value: controller.themeSwitcher.value,
                          activeColor: primaryColor(context),
                          autofocus: true,
                          focusColor: primaryColor(context).withOpacity(0.2),
                          inactiveThumbColor: primaryColor(context),
                          thumbIcon: MaterialStateProperty.all(Icon(
                              controller.themeSwitcher.value
                                  ? Icons.light_mode_outlined
                                  : Iconsax.moon,
                              color: darkDarkLightLightColor(context))),
                          inactiveTrackColor: darkDarkLightLightColor(context),
                          onChanged: controller.onUpdateCurrentUpdateUi),
                    ))
              ],
            ),

            /* ------------------------------------------ PADDING ------------------------------------------ */
            Padding(
              padding:
                  const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
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
                            Text(CustomTextStrings.TITLE,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(fontSize: 60)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text(CustomTextStrings.SUB_TITLE,
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
                                  text: CustomTextStrings.OUR_SERVICRS,
                                  onClick:controller.onNavigateToServiceScreen,
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
                  Text(CustomTextStrings.OUR_SERVICRS,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: CustomColors.PRIMARY_LIGHT)),

                  /* ------------------------------------------ SPACER ------------------------------------------ */
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Text(CustomTextStrings.OUR_SERVICRS_SUB,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontSize: 40)),

                  /* ------------------------------------------ SPACER ------------------------------------------ */
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                  /* ------------------------------------------ DIGITAL OFFERS ------------------------------------------ */
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: CustomServiceTile(
                              image: "assets/icons/app_dev.png",
                              title: CustomTextStrings.DIGITAL_OFFERS_TITLE1,
                              description:
                                  CustomTextStrings.DIGITAL_OFFERS_DESC1)),
                      SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                      Expanded(
                          child: CustomServiceTile(
                              image: "assets/icons/web_site_dev.png",
                              title: CustomTextStrings.DIGITAL_OFFERS_TITLE2,
                              description:
                                  CustomTextStrings.DIGITAL_OFFERS_DESC2)),
                      SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                      Expanded(
                          child: CustomServiceTile(
                              image: "assets/icons/web_app_dev.png",
                              title: CustomTextStrings.DIGITAL_OFFERS_TITLE3,
                              description:
                                  CustomTextStrings.DIGITAL_OFFERS_DESC3)),
                      SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
                      Expanded(
                          child: CustomServiceTile(
                              image: "assets/icons/advertising_dev.png",
                              title: CustomTextStrings.DIGITAL_OFFERS_TITLE4,
                              description:
                                  CustomTextStrings.DIGITAL_OFFERS_DESC4)),
                    ],
                  ),
                ],
              ),
            ),

            /* ------------------------------------------ SOME INFO ------------------------------------------ */
            Container(
              width: getWidth(context),
              padding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
              decoration: BoxDecoration(
                color: primaryColor(context),
                border: Border.all(width: 0.5, color: CustomColors.GREY_DARK),
              ),
              child: Column(
                children: [
                  Text("Transformative Digital offerings",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontSize: 40, color: CustomColors.WHITE)),
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

            /* ------------------------------------------ OUR DIGITAL SUCCESS ------------------------------------------ */
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: CustomSizes.SPACE_BETWEEN_SECTIONS * 3,
                  horizontal: CustomSizes.SPACE_BETWEEN_SECTIONS * 10),
              child: Column(
                children: [
                  Text("Notre Spécialité Numérique",
                      style: Theme.of(context).textTheme.headlineLarge),

                  /* ------------------------------------------ SPACER ------------------------------------------ */
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  Text("Pour plus d'informations, contactez-nous",
                      style: Theme.of(context).textTheme.titleMedium),

                  /* ------------------------------------------ SPACER ------------------------------------------ */
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  const Row(
                    children: [
                      Expanded(
                          child: CustomServiceItem(
                              imgUrl: "assets/images/mobile_app/web_design.png",
                              header: "Web Design",
                              title:
                                  "Mobile Application Mastery: Crafting Innovative Solutions")),
                      SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS / 2),
                      Expanded(
                          child: CustomServiceItem(
                              imgUrl: "assets/images/mobile_app/web_app.png",
                              header: "Web App",
                              title:
                                  "Mobile Application Mastery: Crafting Innovative Solutions")),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                  const Row(
                    children: [
                      Expanded(
                          child: CustomServiceItem(
                              imgUrl: "assets/images/mobile_app/ui_ux.jpg",
                              header: "UI/UX Design",
                              title:
                                  "Mobile Application Mastery: Crafting Innovative Solutions")),
                      SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS / 2),
                      Expanded(
                          child: CustomServiceItem(
                              imgUrl:
                                  "assets/images/mobile_app/social_media_marketing.jpg",
                              header: "Marketing Digital",
                              title:
                                  "Mobile Application Mastery: Crafting Innovative Solutions")),
                    ],
                  )
                ],
              ),
            ),

            /* ------------------------------------------ SPACER ------------------------------------------ */
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

            /* ------------------------------------------ GRID VIEW TITLE ------------------------------------------ */
            Text("Notre Projects Digital",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: 40)),

            /* ------------------------------------------ SPACER ------------------------------------------ */
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            /* ------------------------------------------ GRID VIEW SUBTITLE ------------------------------------------ */
            Text(
                "Notre équipe vous accompagne et assure un suivi client de qualité.",
                style: Theme.of(context).textTheme.titleMedium),

            /* ------------------------------------------ SPACER ------------------------------------------ */
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),


            /* ------------------------------------------ GRID VIEW ------------------------------------------ */
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
              child: CustomGridView(
                  itemsInRow: 4,
                  spaceBetweenRows: CustomSizes.SPACE_BETWEEN_ITEMS,
                  spaceBetweenColumns: CustomSizes.SPACE_BETWEEN_SECTIONS,
                  itemsHeight: getWidth(context)*0.15,
                  count: controller.projectsBackground.length,
                  itemBuilder: (BuildContext context, int index) => Obx(
                        () => CustomProjectCover(
                            onClick:controller.onNavigateToServiceScreen,
                            onHover: (hover, img) {
                              controller.onUpdateHoverState(hover);
                              controller.currentHoverItem.value = img;
                            },
                            image: controller.projectsBackground[index],
                            child: controller.projectsBackground[index] ==
                                    controller.currentHoverItem.value
                                ? Container(
                                    decoration: BoxDecoration(
                                        color:
                                            grayColor(context).withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(
                                            CustomSizes.SPACE_BETWEEN_ITEMS)),
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
            ),



            /* ------------------------------------------ PACKAGES ------------------------------------------ */
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: CustomSizes.SPACE_BETWEEN_SECTIONS*3,
                  horizontal: CustomSizes.SPACE_DEFAULT),
              child: Column(
                children: [
                  Text("Price Plan",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: primaryColor(context))),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                  Text("Creative Solutions, Transparent Pricing",
                      style: Theme.of(context).textTheme.headlineLarge),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: CustomSizes.SPACE_BETWEEN_ITEMS,
                            vertical: CustomSizes.SPACE_DEFAULT),
                        decoration: BoxDecoration(
                            border: Border.all(color: darkLightColor(context)),
                            borderRadius:
                                BorderRadius.circular(CustomSizes.SPACE_DEFAULT)),
                        child: Column(
                          children: [
                            Text("Prime",
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text(
                                "Tout ce dont vous avez besoin pour créer votre site Web",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                            Text("499 Dh / mois",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(fontSize: 40)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS),
                            Divider(color: grayColor(context)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS),
                            CustomPackItemTile(
                                title: "Conception De site-web",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Professionnel Site-web",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Nom De Domaine .MA .COM etc",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            const CustomPackItemTile(
                                title: "Hébergement Rapide SSD"),
                            const CustomPackItemTile(
                                title: "Site-web sécurisé via SSL"),
                            const CustomPackItemTile(
                                title: "Site-web Responsive (Adaptable)"),
                            CustomPackItemTile(
                                title: "Professionnel Email",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Thème Clair + Sombre",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            const CustomPackItemTile(title: "1 Langue"),
                            const CustomPackItemTile(
                                title: "Instagram Professionnel"),
                            const CustomPackItemTile(
                                title: "Facebook Professionnel"),
                            CustomPackItemTile(
                                title: "Publication Par Semaine",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            const CustomPackItemTile(
                                title: "Livraison très rapide"),
                            const CustomPackItemTile(title: "Assistance 24/7"),
                            const CustomPackItemTile(title: "Logo Gratuit"),
                            CustomPackItemTile(
                                title: "Carte De Visite Gratuit",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS),
                            WidgetAnimator(
                                atRestEffect: WidgetRestingEffects.wave(),
                                child: CustomOutlinedButton(
                                    text: "SELECT PLAN",
                                    onClick:
                                        ()=>controller.onNavigateToContactUsScreen(context),
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
                            borderRadius:
                                BorderRadius.circular(CustomSizes.SPACE_DEFAULT)),
                        child: Column(
                          children: [
                            Text("Business",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: CustomColors.WHITE)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text(
                                "Passez au niveau supérieur avec plus de puissance et des fonctionnalités améliorées",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: CustomColors.WHITE)),
                            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                            Text("999 Dh / mois",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                        fontSize: 40, color: CustomColors.WHITE)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS),
                            Divider(color: CustomColors.WHITE.withOpacity(0.5)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS),
                            const CustomPackItemTile(
                              title: "Conception De site-web",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Conception D'application Web",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Professionnel Site-web",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Professionnel Application Web",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Nom De Domaine .MA .COM etc",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Hébergement Rapide SSD",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Site-web Sécurisé Via SSL",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Application Web Sécurisé Via SSL",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Site-web Responsive (Adaptable)",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Application Web Responsive (Adaptable)",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Mise à Jour",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Panneau D'administration",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Thème Clair + Sombre",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Commande Via WhatsApp",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "2 Langues",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Email Professionnel",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Instagram Professionnel",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Facebook Professionnel",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Publication Par Semaine",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Annonce Par Semaine",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Analyse D'annonce",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Livraison très rapide",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Assistance 24/7",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Logo Gratuit",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const CustomPackItemTile(
                              title: "Carte De Visite Gratuit",
                              colorTitle: CustomColors.WHITE,
                              colorIcon: CustomColors.WHITE,
                            ),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS),
                            WidgetAnimator(
                                atRestEffect: WidgetRestingEffects.bounce(),
                                child: CustomElevatedButton(
                                    text: "SELECT PLAN",
                                    onClick:
                                        ()=>controller.onNavigateToContactUsScreen(context),
                                    width: 200,
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: CustomColors.WHITE,
                                        foregroundColor: primaryColor(context))))
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
                            border: Border.all(color: darkLightColor(context)),
                            borderRadius:
                                BorderRadius.circular(CustomSizes.SPACE_DEFAULT)),
                        child: Column(
                          children: [
                            Text("Start-up",
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text(
                                "Bénéficiez de performances optimisées et de ressources dédiées",
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium),
                            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                            Text("1499 Dh / mois",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(fontSize: 40)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS),
                            Divider(color: grayColor(context)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS),
                            CustomPackItemTile(
                                title: "Conception De site-web",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Conception D'application Web",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Conception D'application Mobile",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Professionnel Site-web",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Professionnel Application Web",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Professionnel Application Mobile",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Nom De Domaine .MA .COM etc",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            const CustomPackItemTile(
                                title: "Hébergement Rapide SSD"),
                            const CustomPackItemTile(
                                title: "Site-web Sécurisé Via SSL"),
                            const CustomPackItemTile(
                                title: "Application Web Sécurisé Via SSL"),
                            const CustomPackItemTile(
                                title: "Site-web Responsive (Adaptable)"),
                            const CustomPackItemTile(
                                title: "Application Web Responsive (Adaptable)"),
                            const CustomPackItemTile(
                                title:
                                    "Application Mobile Responsive (Adaptable)"),
                            const CustomPackItemTile(title: "Mise à Jour"),
                            CustomPackItemTile(
                                title: "Panneau D'administration",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Thème Clair + Sombre",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Commande Online",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Paiement Online",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Commande Via WhatsApp",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "+3 Langues",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Email Professionnel",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            const CustomPackItemTile(
                                title: "Instagram Professionnel"),
                            const CustomPackItemTile(
                                title: "Facebook Professionnel"),
                            CustomPackItemTile(
                                title: "Publication Par Semaine",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Annonce Par Semaine",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            CustomPackItemTile(
                                title: "Analyse D'annonce",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            const CustomPackItemTile(
                                title: "Livraison très rapide"),
                            const CustomPackItemTile(title: "Assistance 24/7"),
                            CustomPackItemTile(
                                title: "Boutique Sur Google",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            const CustomPackItemTile(title: "Logo Gratuit"),
                            CustomPackItemTile(
                                title: "Carte De Visite Gratuit",
                                bgColor: primaryColor(context)
                                    .withOpacity(isDark(context) ? 0.4 : 0.1)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS),
                            WidgetAnimator(
                                atRestEffect: WidgetRestingEffects.wave(),
                                child: CustomOutlinedButton(
                                    text: "SELECT PLAN",
                                    onClick:
                                        ()=>controller.onNavigateToContactUsScreen(context),
                                    width: 200,
                                    withDefaultPadding: false))
                          ],
                        ),
                      ),
                    ),
                  ],
                )],
              ),
            ),

            /* ------------------------------------------ OUR VALUES ------------------------------------------ */
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: CustomSizes.SPACE_BETWEEN_SECTIONS,
                  horizontal: CustomSizes.SPACE_BETWEEN_SECTIONS * 4),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Image.asset(
                        "assets/icons/reactive_icon.png",
                        height: 100,
                        width: 100,
                      ),
                      title: Text("Réactivité",
                          style: Theme.of(context).textTheme.headlineMedium),
                      subtitle: Text(
                          "Notre équipe se charge de vous donner une réponse rapide sous 48h maximum.",
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Image.asset(
                        "assets/icons/performance_icon.png",
                        height: 100,
                        width: 100,
                      ),
                      title: Text("Performance",
                          style: Theme.of(context).textTheme.headlineMedium),
                      subtitle: Text(
                          "Nous étudions et analysons votre projet digital en mobilisant l’ensemble de nos compétences.",
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Image.asset(
                        "assets/icons/professional_icon.png",
                        height: 100,
                        width: 100,
                      ),
                      title: Text("Professionnalisme",
                          style: Theme.of(context).textTheme.headlineMedium),
                      subtitle: Text(
                          "Notre équipe a à cœur de réaliser des projets de qualité pour ses clients.",
                          style: Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                ],
              ),
            ),

            /* ------------------------------------------ PROGRAMMING LANGUAGES ------------------------------------------ */
            Container(
              color: CustomColors.BLACK,
              padding: const EdgeInsets.symmetric(
                  vertical: CustomSizes.SPACE_BETWEEN_SECTIONS * 2,
                  horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
              child: Row(
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
                      child: Image.asset("assets/icons/languages/java_icon.png",
                          height: 60, width: 60, color: grayColor(context)),
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
                      child: Image.asset("assets/icons/languages/html_icon.png",
                          height: 60, width: 60, color: grayColor(context)),
                    ),
                  ),
                  Expanded(
                    child: WidgetAnimator(
                      atRestEffect: WidgetRestingEffects.size(
                          duration: const Duration(seconds: 3)),
                      child: Image.asset("assets/icons/languages/css_icon.png",
                          height: 60, width: 60, color: grayColor(context)),
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
                      child: Image.asset("assets/icons/languages/php_icon.png",
                          height: 60, width: 60, color: grayColor(context)),
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
            ),

            /* ------------------------------------------ FOOTER ------------------------------------------ */
            Container(
              width: getWidth(context),
              color: CustomColors.BLACK,
              padding: const EdgeInsets.symmetric(
                  vertical: CustomSizes.SPACE_DEFAULT,
                  horizontal: CustomSizes.SPACE_BETWEEN_SECTIONS),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/logos/logo_light.png",
                          height: 150, width: 350),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: CustomColors.WHITE),
                                borderRadius: BorderRadius.circular(
                                    CustomSizes.SPACE_BETWEEN_SECTIONS)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Iconsax.instagram,
                                  color: CustomColors.WHITE),
                            ),
                          ),
                          const SizedBox(
                              width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: CustomColors.WHITE),
                                borderRadius: BorderRadius.circular(
                                    CustomSizes.SPACE_BETWEEN_SECTIONS)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child:
                                  Icon(Icons.tiktok, color: CustomColors.WHITE),
                            ),
                          ),
                          const SizedBox(
                              width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: CustomColors.WHITE),
                                borderRadius: BorderRadius.circular(
                                    CustomSizes.SPACE_BETWEEN_SECTIONS)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.facebook,
                                  color: CustomColors.WHITE),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(color: CustomColors.GREY_DARK),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Liens d’aide",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: CustomColors.WHITE)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            const CustomPackItemTile(
                                title: "Principal",
                                colorTitle: CustomColors.WHITE,
                                icon: Iconsax.arrow_right_41),
                            const CustomPackItemTile(
                                title: "Les Services",
                                colorTitle: CustomColors.WHITE,
                                icon: Iconsax.arrow_right_41),
                            const CustomPackItemTile(
                                title: "À Propos De Nous",
                                colorTitle: CustomColors.WHITE,
                                icon: Iconsax.arrow_right_41),
                            const CustomPackItemTile(
                                title: "Les projets",
                                colorTitle: CustomColors.WHITE,
                                icon: Iconsax.arrow_right_41),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CONTACTEZ-NOUS",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: CustomColors.WHITE)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            const CustomPackItemTile(
                                title: "Maroc : +212 624 778 355",
                                colorTitle: CustomColors.WHITE,
                                icon: Iconsax.call_calling),
                            const CustomPackItemTile(
                                title: "France : +31 724 778 3655",
                                colorTitle: CustomColors.WHITE,
                                icon: Iconsax.call_calling),
                            const CustomPackItemTile(
                                title: "Email : Contact@ezil.com",
                                colorTitle: CustomColors.WHITE,
                                icon: Icons.alternate_email),
                            const CustomPackItemTile(
                                title:
                                    "MAROC, AGADIR, 80000, HAY SALAM G10 N 384",
                                colorTitle: CustomColors.WHITE,
                                icon: Iconsax.location),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("CONTACTEZ-NOUS",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(color: CustomColors.WHITE)),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            const CustomPackItemTile(
                                title: "Maroc : +212 624 778 355",
                                colorTitle: CustomColors.WHITE,
                                icon: Iconsax.call_calling),
                            const CustomPackItemTile(
                                title: "France : +31 724 778 3655",
                                colorTitle: CustomColors.WHITE,
                                icon: Iconsax.call_calling),
                            const CustomPackItemTile(
                                title: "Email : Contact@ezil.com",
                                colorTitle: CustomColors.WHITE,
                                icon: Icons.alternate_email),
                            const CustomPackItemTile(
                                title:
                                    "MAROC, AGADIR, 80000, HAY SALAM G10 N 384",
                                colorTitle: CustomColors.WHITE,
                                icon: Iconsax.location),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  const Divider(color: CustomColors.GREY_DARK),
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                  Text("EZIL AGENCY © 2024 – Tous droits réservés.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: CustomColors.GREY_DARK))
                ],
              ),
            ),
          ],
        ),
      ),
      /* ------------------------------------------ FLOATING ACTION BUTTON ------------------------------------------ */
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            /* ------------------------------------------ FLOATING ACTION BUTTON 1 ------------------------------------------ */
            WidgetAnimator(
              atRestEffect:
                  WidgetRestingEffects.wave(curve: Curves.fastOutSlowIn),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: CustomSizes.SPACE_BETWEEN_SECTIONS),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: controller.onNavigateToGmail,
                      hoverColor: CustomColors.RED.withOpacity(0.4),
                      onHover: controller.onUpdateHoverContactIconsState,
                      borderRadius: BorderRadius.circular(
                          CustomSizes.SPACE_BETWEEN_SECTIONS),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/gmail_icon.png",
                              height: 54, width: 54),
                          Obx(
                            () => Text(
                                controller.isHoveringContactIcons.isTrue
                                    ? "  EMAIL   "
                                    : "",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ],
                      ),
                    ),

                    /* ------------------------------------------ SPACER ------------------------------------------ */
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                    /* ------------------------------------------ FLOATING ACTION BUTTON 2 ------------------------------------------ */
                    InkWell(
                      onTap: controller.onNavigateToPhoneCall,
                      hoverColor: CustomColors.BLUE.withOpacity(0.4),
                      onHover: controller.onUpdateHoverContactIconsState,
                      borderRadius: BorderRadius.circular(
                          CustomSizes.SPACE_BETWEEN_SECTIONS),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/telephone_icon.png",
                              height: 50, width: 50),
                          Obx(
                            () => Text(
                                controller.isHoveringContactIcons.isTrue
                                    ? "  PHONE CALL   "
                                    : "",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ],
                      ),
                    ),

                    /* ------------------------------------------ SPACER ------------------------------------------ */
                    const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                    /* ------------------------------------------ FLOATING ACTION BUTTON 3 ------------------------------------------ */
                    InkWell(
                      onTap:(){controller.onNavigateToWhatsapp();},
                      hoverColor: CustomColors.GREEN_LIGHT.withOpacity(0.4),
                      onHover: controller.onUpdateHoverContactIconsState,
                      borderRadius: BorderRadius.circular(
                          CustomSizes.SPACE_BETWEEN_SECTIONS),
                      child: Row(
                        children: [
                          Image.asset("assets/icons/whatsapp_icon.png",
                              height: 50, width: 50),
                          Obx(
                            () => Text(
                                controller.isHoveringContactIcons.isTrue
                                    ? "  WHATSAPP   "
                                    : "",
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            Obx(
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
                  child: const Icon(Iconsax.arrow_up_24,
                      color: CustomColors.WHITE),
                ),
              ),
            ),
          ]),
    );
  }
}
