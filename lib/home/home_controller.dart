import 'package:ezil_agency/common/widgets/custom_elevated_button.dart';
import 'package:ezil_agency/common/widgets/custom_text_field.dart';
import 'package:ezil_agency/utils/constants/custom_colors.dart';
import 'package:ezil_agency/utils/constants/custom_sizes.dart';
import 'package:ezil_agency/utils/extensions/validator.dart';
import 'package:ezil_agency/utils/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxBool isHovering,
      showFloatingActionButton,
      themeSwitcher,
      isHoveringFirstPlan,
      isHoveringSecondPlan,
      isHoveringLastPlan,
      isHoveringContactIcons;

  late final RxString selectedRadioButton;

  late final TextEditingController fullNameController,
      phoneController,
      messageController;

  late final RxString currentHoverItem;
  late final ScrollController scrollController;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    isHovering = false.obs;
    currentHoverItem = "".obs;
    scrollController = ScrollController();
    showFloatingActionButton = false.obs;
    themeSwitcher = false.obs;
    isHoveringFirstPlan = false.obs;
    isHoveringSecondPlan = false.obs;
    isHoveringLastPlan = false.obs;
    isHoveringContactIcons = false.obs;
    selectedRadioButton = "Business".obs;
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    messageController = TextEditingController();
    manageScrollController();
    onUpdateCurrentUpdateUi(true);
  }

  // - - - - - - - - - - - - - - - - - - UPDATE HOVER STATES - - - - - - - - - - - - - - - - - -  //
  onUpdateHoverState(bool hover) => isHovering.value = hover;

  onUpdateHoverFirstPlanState(bool hover) => isHoveringFirstPlan.value = hover;

  onUpdateHoverSecondPlanState(bool hover) =>
      isHoveringSecondPlan.value = hover;

  onUpdateHoverLastPlanState(bool hover) => isHoveringLastPlan.value = hover;

  onUpdateHoverContactIconsState(bool hover) =>
      isHoveringContactIcons.value = hover;

  // - - - - - - - - - - - - - - - - - - UPDATE UPGRADE UI SWITCH BUTTON - - - - - - - - - - - - - - - - - -  //
  onUpdateCurrentUpdateUi(bool switched) async {
    themeSwitcher.value = switched;
    themeSwitcher.isTrue
        ? Get.changeTheme(ThemeApp.darkTheme)
        : Get.changeTheme(ThemeApp.lightTheme);
  }

  // - - - - - - - - - - - - - - - - - - BUTTONS - - - - - - - - - - - - - - - - - -  //
  onNavigateToServiceScreen() {
    scrollController.animateTo(scrollController.position.maxScrollExtent - 1500,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  onNavigateToContactUsScreen(BuildContext context) {
    Get.defaultDialog(
        title: "",
        middleText: "",
        content: Column(
          children: [
            Text("Get in touch",
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            Text("Let's talk about your project",
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            CustomTextField(
                hint: "Full Name",
                leadingIcon: Iconsax.user,
                autoFocus: true,
                validator: (value) =>
                    Validator.validateEmptyField("Full Name", value),
                controller: fullNameController,
                width: context.width),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS/4),
            CustomTextField(
                hint: "Phone",
                leadingIcon: Iconsax.call,
                textInputType: TextInputType.number,
                validator: (value) => Validator.validatePasswordField(value),
                controller: fullNameController,
                width: context.width),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS/4),
            CustomTextField(
                hint: "Message",
                leadingIcon: Iconsax.message,
                textInputType: TextInputType.emailAddress,
                validator: (value) =>
                    Validator.validateEmptyField("Message", value),
                controller: fullNameController,
                width: context.width),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            Text("Choise Votre Plan", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            Obx(
              () => Row(
                children: [
                  Expanded(
                    child: ListTile(
                        title: Text("Prime",
                            style: Theme.of(context).textTheme.titleLarge),
                        leading: Radio(
                            value: "Prime",
                            fillColor: MaterialStateProperty.all(Get.isDarkMode?CustomColors.WHITE:CustomColors.BLACK),
                            groupValue: selectedRadioButton.value,
                            onChanged: (String? value) {
                              selectedRadioButton.value = value ?? "Prime";
                            })),
                  ),
                  Expanded(
                    child: ListTile(
                        title: Text("Business",
                            style: Theme.of(context).textTheme.titleLarge),
                        leading: Radio(
                            autofocus: true,
                            value: "Business",
                            fillColor: MaterialStateProperty.all(Get.isDarkMode?CustomColors.WHITE:CustomColors.BLACK),
                            groupValue: selectedRadioButton.value,
                            onChanged: (String? value) {
                              selectedRadioButton.value = value ?? "Business";
                            })),
                  ),
                  Expanded(
                    child: ListTile(
                        title: Text("Start-up",
                            style: Theme.of(context).textTheme.titleLarge),
                        leading: Radio(
                            value: "Start-up",
                            groupValue: selectedRadioButton.value,
                            fillColor: MaterialStateProperty.all(Get.isDarkMode?CustomColors.WHITE:CustomColors.BLACK),
                            onChanged: (String? value) {
                              selectedRadioButton.value = value ?? "Start-up";
                            })),
                  )
                ],
              ),
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            CustomElevatedButton(
                text: "Validate",
                onClick: () {
                  Get.back();
                },
                width: context.width / 2),
          ],
        ));
  }

  onNavigateToAboutUsScreen() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  onNavigateToProjectsScreen() {
    scrollController.animateTo(scrollController.position.maxScrollExtent - 2500,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  onNavigateToGmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: "prizidatv@gmail.com",
      queryParameters: {'subject': "", 'body': ""},
    );

    launchUrl(emailLaunchUri);
  }

  onNavigateToPhoneCall() {
    launchUrl(Uri.parse("tel://212624778355"));
  }

  onNavigateToWhatsapp({String phone = "624778355", String message = ""}) {
    launchUrl(Uri.parse("https://wa.me/$phone?text=$message"));
  }

  // - - - - - - - - - - - - - - - - - - SCROLL CONTROLLER - - - - - - - - - - - - - - - - - -  //
  manageScrollController() async {
    scrollController.addListener(() {
      double showOffset = 30.0;
      if (scrollController.offset > showOffset) {
        showFloatingActionButton.value = true;
      } else {
        showFloatingActionButton.value = false;
      }
    });
  }

  // - - - - - - - - - - - - - - - - - - PROJECTS BACKGROUND  - - - - - - - - - - - - - - - - - -  //
  final projectsBackground = [
    /*------------- mobile apps images -------------*/
    "assets/images/mobile_app/clothes_app.png",
    "assets/images/mobile_app/coffee_app.png",
    "assets/images/mobile_app/food_app.jpg",
    "assets/images/mobile_app/hotels_app.png",
    /*------------- web apps images -------------*/
    "assets/images/web_app/ecommerce_web_app.png",
    "assets/images/web_app/food_web_app.png",
    "assets/images/web_app/coffee_web_app.jpg",
    "assets/images/web_app/hotel_web_app.jpeg",
    /*------------- web sites images -------------*/
    "assets/images/web_site/hotel_web.jpeg",
    "assets/images/web_site/ecommerce_web.jpeg",
    "assets/images/web_site/sport_web.jpeg",
    "assets/images/web_site/food_web.jpeg",
  ];

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    isHovering.close();
    currentHoverItem.close();
    isHoveringFirstPlan.close();
    isHoveringSecondPlan.close();
    isHoveringLastPlan.close();
    super.dispose();
  }
}

/*
  // - - - - - - - - - - - - - - - - - - PROJECTS BACKGROUND  - - - - - - - - - - - - - - - - - -  //
  final languages = [
    "assets/icons/languages/flutter_icon.png",
    "assets/icons/languages/swift_icon.png",
    "assets/icons/languages/java_icon.png",
    "assets/icons/languages/kotlin_icon.png",
    "assets/icons/languages/react_native_icon.png",
    "assets/icons/languages/android_studio_icon.png",
    "assets/icons/languages/django_icon.png",
    "assets/icons/languages/html_icon.png",
    "assets/icons/languages/css_icon.png",
    "assets/icons/languages/python_icon.png",
    "assets/icons/languages/laravel_icon.png",
    "assets/icons/languages/php_icon.png",
    "assets/icons/languages/vscode_icon.png",
    "assets/icons/languages/xcode_icon.png",
  ];
 */
