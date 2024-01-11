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
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS),
                      Text("Services",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS),
                      Text("About us",
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS),
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
                            onChanged: controller.onUpdateCurrentUpdateUi
                            ),
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
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3),
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text("Prime",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium),
                          const SizedBox(
                              height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Text(
                              "Tout ce dont vous avez besoin pour créer votre site Web",
                              textAlign: TextAlign.center,
                              style:
                                  Theme.of(context).textTheme.bodyMedium),
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
                               bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Professionnel Site-web",bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Nom De Domaine .MA .COM etc", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                          const CustomPackItemTile(
                              title: "Hébergement Rapide SSD"),
                          const CustomPackItemTile(
                              title: "Site-web sécurisé via SSL"),
                          const CustomPackItemTile(
                              title: "Site-web Responsive (Adaptable)"),
                           CustomPackItemTile(
                              title: "Professionnel Email",bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Thème Clair + Sombre", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                          const CustomPackItemTile(title: "1 Langue"),
                          const CustomPackItemTile(
                              title: "Instagram Professionnel"),
                          const CustomPackItemTile(
                              title: "Facebook Professionnel"),
                           CustomPackItemTile(
                              title: "Publication Par Semaine",bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                          const CustomPackItemTile(
                              title: "Livraison très rapide"),
                          const CustomPackItemTile(
                              title: "Assistance 24/7"),
                          const CustomPackItemTile(title: "Logo Gratuit"),
                           CustomPackItemTile(
                              title: "Carte De Visite Gratuit", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                          const SizedBox(
                              height: CustomSizes.SPACE_BETWEEN_ITEMS),
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
                                      fontSize: 40,
                                      color: CustomColors.WHITE)),
                          const SizedBox(
                              height: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Divider(
                              color: CustomColors.WHITE.withOpacity(0.5)),
                          const SizedBox(
                              height: CustomSizes.SPACE_BETWEEN_ITEMS),
                           const CustomPackItemTile(
                            title: "Conception De site-web",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Conception D'application Web",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Professionnel Site-web",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Professionnel Application Web",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Nom De Domaine .MA .COM etc",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Hébergement Rapide SSD",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Site-web Sécurisé Via SSL",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Application Web Sécurisé Via SSL",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Site-web Responsive (Adaptable)",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Application Web Responsive (Adaptable)",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Mise à Jour",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Panneau D'administration",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Thème Clair + Sombre",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Commande Via WhatsApp",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "2 Langues",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Email Professionnel",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Instagram Professionnel",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Facebook Professionnel",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Publication Par Semaine",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Annonce Par Semaine",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Analyse D'annonce",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Livraison très rapide",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                           const CustomPackItemTile(
                            title: "Assistance 24/7",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Logo Gratuit",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const CustomPackItemTile(
                            title: "Carte De Visite Gratuit",
                            colorTitle: CustomColors.WHITE,colorIcon: CustomColors.WHITE,
                          ),
                          const SizedBox(
                              height: CustomSizes.SPACE_BETWEEN_ITEMS),
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
                          Text("Start-up",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium),
                          const SizedBox(
                              height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Text(
                              "Bénéficiez de performances optimisées et de ressources dédiées",
                              textAlign: TextAlign.center,
                              style:
                                  Theme.of(context).textTheme.bodyMedium),
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
                              title: "Conception De site-web", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Conception D'application Web", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Conception D'application Mobile", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Professionnel Site-web", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Professionnel Application Web", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Professionnel Application Mobile", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Nom De Domaine .MA .COM etc", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                          const CustomPackItemTile(
                              title: "Hébergement Rapide SSD"),
                          const CustomPackItemTile(
                              title: "Site-web Sécurisé Via SSL"),
                          const CustomPackItemTile(
                              title: "Application Web Sécurisé Via SSL"),
                          const CustomPackItemTile(
                              title: "Site-web Responsive (Adaptable)"),
                          const CustomPackItemTile(
                              title:
                                  "Application Web Responsive (Adaptable)"),
                          const CustomPackItemTile(
                              title:
                                  "Application Mobile Responsive (Adaptable)"),
                          const CustomPackItemTile(title: "Mise à Jour"),
                           CustomPackItemTile(
                              title: "Panneau D'administration", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Thème Clair + Sombre", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Commande Online", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Paiement Online", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Commande Via WhatsApp", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(title: "+3 Langues" ,bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Email Professionnel", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                          const CustomPackItemTile(
                              title: "Instagram Professionnel"),
                          const CustomPackItemTile(
                              title: "Facebook Professionnel"),
                           CustomPackItemTile(
                              title: "Publication Par Semaine", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Annonce Par Semaine", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                           CustomPackItemTile(
                              title: "Analyse D'annonce", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                          const CustomPackItemTile(
                              title: "Livraison très rapide"),
                          const CustomPackItemTile(
                              title: "Assistance 24/7"),
                           CustomPackItemTile(
                              title: "Boutique Sur Google", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                          const CustomPackItemTile(title: "Logo Gratuit"),
                           CustomPackItemTile(
                              title: "Carte De Visite Gratuit", bgColor: primaryColor(context).withOpacity(isDark(context) ? 0.4 : 0.1)),
                          const SizedBox(
                              height: CustomSizes.SPACE_BETWEEN_ITEMS),
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
            Container(
              color: CustomColors.BLACK,
              padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_SECTIONS * 1.5),
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
            ),

              /* ------------------------------------------ SPACER ------------------------------------------ */
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),

              /* ------------------------------------------ FOOTER ------------------------------------------ */
              Container(
                width: getWidth(context),
                color: darkLightColor(context),
                padding: const EdgeInsets.symmetric(vertical : CustomSizes.SPACE_DEFAULT, horizontal : CustomSizes.SPACE_BETWEEN_SECTIONS ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                            isDark(context)
                                ? "assets/logos/logo_dark.png"
                                : "assets/logos/logo_light.png",
                            height: 150,
                            width: 350),
                        const Spacer(),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: darkDarkLightLightColor(context)),
                                  borderRadius: BorderRadius.circular(
                                      CustomSizes.SPACE_BETWEEN_SECTIONS)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Iconsax.instagram,
                                    color: darkDarkLightLightColor(context)),
                              ),
                            ),
                            const SizedBox(
                                width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: darkDarkLightLightColor(context)),
                                  borderRadius: BorderRadius.circular(
                                      CustomSizes.SPACE_BETWEEN_SECTIONS)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.tiktok,
                                    color: darkDarkLightLightColor(context)),
                              ),
                            ),
                            const SizedBox(
                                width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: darkDarkLightLightColor(context)),
                                  borderRadius: BorderRadius.circular(
                                      CustomSizes.SPACE_BETWEEN_SECTIONS)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.facebook,
                                    color: darkDarkLightLightColor(context)),
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
                                      ?.copyWith(
                                          color: darkDarkLightLightColor(
                                              context))),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              CustomPackItemTile(
                                  title: "Principal",
                                  colorTitle: darkDarkLightLightColor(context),
                                  icon: Iconsax.arrow_right_41),
                              CustomPackItemTile(
                                  title: "Les Services",
                                  colorTitle: darkDarkLightLightColor(context),
                                  icon: Iconsax.arrow_right_41),
                              CustomPackItemTile(
                                  title: "À Propos De Nous",
                                  colorTitle: darkDarkLightLightColor(context),
                                  icon: Iconsax.arrow_right_41),
                              CustomPackItemTile(
                                  title: "Les projets",
                                  colorTitle: darkDarkLightLightColor(context),
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
                                      ?.copyWith(
                                          color: darkDarkLightLightColor(
                                              context))),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              CustomPackItemTile(
                                  title: "Maroc : +212 624 778 355",
                                  colorTitle: darkDarkLightLightColor(context),
                                  icon: Iconsax.call_calling),
                              CustomPackItemTile(
                                  title: "France : +31 724 778 3655",
                                  colorTitle: darkDarkLightLightColor(context),
                                  icon: Iconsax.call_calling),
                              CustomPackItemTile(
                                  title: "Email : Contact@ezil.com",
                                  colorTitle: darkDarkLightLightColor(context),
                                  icon: Icons.alternate_email),
                              CustomPackItemTile(
                                  title:
                                      "MAROC, AGADIR, 80000, HAY SALAM G10 N 384",
                                  colorTitle: darkDarkLightLightColor(context),
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
                                      ?.copyWith(
                                          color: darkDarkLightLightColor(
                                              context))),
                              const SizedBox(
                                  height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              CustomPackItemTile(
                                  title: "Maroc : +212 624 778 355",
                                  colorTitle: darkDarkLightLightColor(context),
                                  icon: Iconsax.call_calling),
                              CustomPackItemTile(
                                  title: "France : +31 724 778 3655",
                                  colorTitle: darkDarkLightLightColor(context),
                                  icon: Iconsax.call_calling),
                              CustomPackItemTile(
                                  title: "Email : Contact@ezil.com",
                                  colorTitle: darkDarkLightLightColor(context),
                                  icon: Icons.alternate_email),
                              CustomPackItemTile(
                                  title:
                                      "MAROC, AGADIR, 80000, HAY SALAM G10 N 384",
                                  colorTitle: darkDarkLightLightColor(context),
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
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                child:
                    const Icon(Iconsax.arrow_up_24, color: CustomColors.WHITE),
              ),
            ),
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          WidgetAnimator(
            atRestEffect: WidgetRestingEffects.wave(curve: Curves.fastOutSlowIn),
            child: Image.asset("assets/icons/whatsapp_icon.png", height:50, width: 50),
          ),
        ]));
  }
}
