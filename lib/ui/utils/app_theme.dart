import 'package:flutter/material.dart';
import 'package:project_todo/ui/utils/assets_color.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.bgColor,
      canvasColor: AppColors.White,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.White,
          onPrimary: AppColors.White),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary, centerTitle: true),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.White,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 33),
        unselectedIconTheme: IconThemeData(size: 33, color: AppColors.grey),
      ));

  /// Dark mode

  static ThemeData Dark = ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.bgDark,
      canvasColor: AppColors.black,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.black,
          onPrimary: AppColors.black),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.black,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.white));
}
