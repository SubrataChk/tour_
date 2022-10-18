import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_application/src/app/app_color.dart';
import 'package:tour_application/src/app/app_string.dart';
import 'package:tour_application/src/global/language/app_language.dart';
import 'package:tour_application/src/global/theme/theme.dart';
import 'package:tour_application/src/routes/route.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tour_application/src/view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    box.read("bn");
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          translations: AppLanguage(),
          theme: AppTheme().lightTheme(context),
          darkTheme: AppTheme().darkTheme(context),
          themeMode: AppTheme().getThemeMode(), //ThemeMode.system,
          initialRoute: splash,
          locale:
              box.read("bn") == true ? Locale('bn', 'BD') : Locale('en', 'US'),
          fallbackLocale: Locale('en', "US"),
          getPages: getPages,
          home: const SplashScreen(),
        );
      },
    );
  }
}
