import 'package:get/get.dart';
import 'package:tour_application/src/view/add/add.dart';
import 'package:tour_application/src/view/add/last_step.dart';
import 'package:tour_application/src/view/auth/create/sign_up.dart';
import 'package:tour_application/src/view/auth/login/log_in.dart';
import 'package:tour_application/src/view/bottom_nav/bottom_nav.dart';
import 'package:tour_application/src/view/details/details.dart';
import 'package:tour_application/src/view/drawer/faq.dart';
import 'package:tour_application/src/view/drawer/how_to_use.dart';
import 'package:tour_application/src/view/drawer/privacy.dart';
import 'package:tour_application/src/view/drawer/rate_us.dart';
import 'package:tour_application/src/view/drawer/setting.dart';
import 'package:tour_application/src/view/drawer/support.dart';
import 'package:tour_application/src/view/home/home.dart';
import 'package:tour_application/src/view/home/seeAll/see_all.dart';
import 'package:tour_application/src/view/onboarding/onboarding.dart';
import 'package:tour_application/src/view/privacy/privacy_policy.dart';
import 'package:tour_application/src/view/search/search.dart';
import 'package:tour_application/src/view/splash/splash_screen.dart';

import '../view/auth/create/user_form.dart';
import '../view/update/profile_update.dart';

const String splash = "/splash_screen";
const String onboarding = "/onboarding_screen";
const String signup = "/signup_screen";
const String login = "/login_screen";
const String userForm = "/userForm_screen";
const String privacy = "/privacy_screen";
const String bottomNav = "/bottomNav_screen";
//Drawer Section
const String support = "/support_screen";
const String privacySection = "/privacySection_screen";
const String faqSection = "/faqSection_screen";
const String rateUs = "/rateUs_screen";
const String howToUse = "/howToUse_screen";
const String setting = "/setting_screen";
const String search = "/search_screen";
const String details = "/details_screen";
const String lastStep = "/lastStep_screen";
const String seeAll = "/seeAll_screen";
const String profileUpdate = "/profileUpdate_screen";
const String homePage = "/homePage_screen";
const String addSection = "/addSection_screen";

List<GetPage> getPages = [
  GetPage(name: splash, page: () => const SplashScreen()),
  GetPage(name: onboarding, page: () => OnboardingScreen()),
  GetPage(name: signup, page: () => SignUpSection()),
  GetPage(name: login, page: () => const LoginPageSection()),
  GetPage(name: userForm, page: () => UserFormSection()),
  GetPage(name: privacy, page: () => PrivacyPolicy()),
  GetPage(name: bottomNav, page: () => BottomNavigationSection()),
  GetPage(name: support, page: () => SupportSection()),
  GetPage(name: privacySection, page: () => PrivacySection()),
  GetPage(name: faqSection, page: () => FaqSection()),
  GetPage(name: rateUs, page: () => RateUsSection()),
  GetPage(name: howToUse, page: () => HowToUseSection()),
  GetPage(name: setting, page: () => SettingsSection()),
  GetPage(name: search, page: () => SearchScreenSection()),
  GetPage(name: details, page: () => DetailsScreenSection()),
  GetPage(name: addSection, page: () => AddSection()),
  GetPage(
      name: lastStep,
      page: () {
        LastStepDetails _lastStepDetails = Get.arguments;
        return _lastStepDetails;
      }),
  GetPage(name: seeAll, page: () => SeeAllSection()),
  GetPage(name: profileUpdate, page: () => UserProfileUpdate()),
  GetPage(name: homePage, page: () => HomePageSection()),
];
