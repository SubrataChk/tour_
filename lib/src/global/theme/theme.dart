import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_application/src/app/app_color.dart';

class AppTheme {
  ThemeData lightTheme(context) => ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      colorScheme: const ColorScheme.light(),
      primarySwatch: Colors.blue,
      textTheme:
          GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply()),
      scaffoldBackgroundColor: AppColors.scaffoldBackground);

  ThemeData darkTheme(context) => ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      colorScheme: const ColorScheme.dark(),
      primarySwatch: Colors.blue,
      textTheme:
          GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply()),
      scaffoldBackgroundColor: Colors.black38);

  final _getStorage = GetStorage();
  final _darkThemekey = 'isDarkTheme';

  saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemekey, isDarkMode);
  }

  bool isSaveDarkMode() {
    return _getStorage.read(_darkThemekey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSaveDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeThemeMode(bool darkTheme) {
    Get.changeThemeMode(
        isSaveDarkMode() == darkTheme ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSaveDarkMode());
  }
}
