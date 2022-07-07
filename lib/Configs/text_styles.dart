import 'package:flutter/cupertino.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:get/get.dart';

// Contains all the Text styles
class AppStyles {
  // Title or heading text style
  static TextStyle titleStyle({
    Color color = AppColors.textColor,
    double height = 1.5,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      height: height,
    );
  }

//Sub title style
  static TextStyle subTitleStyle({
    Color color = AppColors.textSubtitle,
    double height = 1.5,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: height,
    );
  }

//Price text style
  static TextStyle priceStyle({
    Color color = AppColors.buttonColor,
    double height = 1.5,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      height: height,
    );
  }

  // Input field hint text style
  static TextStyle hintStyle({
    Color color = AppColors.hintColor,
  }) {
    return TextStyle(
      color: Get.isDarkMode ? AppColors.textSubtitle : color,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.03,
    );
  }

  // Input field error text style
  static TextStyle errorTextStyle() {
    return const TextStyle(
      color: AppColors.error,
      fontSize: 14,
      letterSpacing: 0.03,
      height: 0.8,
    );
  }

  // Box Shadow for container
  static List<BoxShadow> boxShadow() {
    return [
      BoxShadow(
        color: Get.theme.shadowColor,
        blurRadius: 4,
        spreadRadius: 4,
      )
    ];
  }
}
