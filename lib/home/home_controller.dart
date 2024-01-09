import 'package:ezil_agency/utils/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxBool isHovering, showFloatingActionButton, themeSwitcher;
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
    manageScrollController();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {}

  // - - - - - - - - - - - - - - - - - - UPDATE HOVER STATE - - - - - - - - - - - - - - - - - -  //
  onUpdateHoverState(bool hover) => isHovering.value = hover;

  // - - - - - - - - - - - - - - - - - - UPDATE UPGRADE UI SWITCH BUTTON - - - - - - - - - - - - - - - - - -  //
  onUpdateCurrentUpdateUi(bool switched) {
    themeSwitcher.value = switched;
    themeSwitcher.isTrue
        ? Get.changeTheme(ThemeApp.darkTheme)
        : Get.changeTheme(ThemeApp.lightTheme);
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
    /*------------- web sites images -------------*/
    "assets/images/web_site/ecommerce_web.jpeg",
    "assets/images/web_site/food_web.jpeg",
    "assets/images/web_site/hotel_web.jpeg",
    "assets/images/web_site/sport_web.jpeg",
    /*------------- mobile apps images -------------*/
    "assets/images/mobile_app/clothes_app.png",
    "assets/images/mobile_app/coffee_app.png",
    "assets/images/mobile_app/food_app.jpg",
    "assets/images/mobile_app/hotels_app.png",
    /*------------- web apps images -------------*/
    "assets/images/web_app/coffee_web_app.jpg",
    "assets/images/web_app/ecommerce_web_app.png",
    "assets/images/web_app/food_web_app.png",
    "assets/images/web_app/hotel_web_app.jpeg",
  ];

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    isHovering.close();
    currentHoverItem.close();
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
