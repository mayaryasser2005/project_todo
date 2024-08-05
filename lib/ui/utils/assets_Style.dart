import 'package:flutter/material.dart';
import 'package:project_todo/ui/utils/assets_color.dart';

abstract class AssetsStyle {
  static const TextStyle appBarStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.White);

  static const TextStyle titlesTextStyle = TextStyle(
      fontSize: 27, fontWeight: FontWeight.bold, color: AppColors.primary);

  static const TextStyle bottomSheetTitle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.black);

  static const TextStyle bodyTextStyle = TextStyle(
      fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.black);

  static const TextStyle normalGreyTextStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.grey);

  static const TextStyle unselectedCalenderDayStyle = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.black);

  static TextStyle selectedCalenderDayStyle =
      unselectedCalenderDayStyle.copyWith(color: AppColors.primary);

  ///Dark Style
  static const TextStyle appBarDarkStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.black);
}
