import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:products_task/Configs/app_colors.dart';
import 'package:products_task/Configs/app_sizes.dart';
import 'package:products_task/Configs/text_styles.dart';

class AppTheme {
  // Theme Data Light
  static ThemeData lightTheme() {
    return ThemeData(
      shadowColor: Colors.grey.withOpacity(0.15),
      textTheme: TextTheme(
        bodyMedium: AppStyles.titleStyle(color: AppColors.textColor).copyWith(fontSize: 14),
        titleMedium: AppStyles.titleStyle(),
        titleSmall: AppStyles.subTitleStyle(),
      ),
      dividerColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.primary,
      dividerTheme: DividerThemeData(
        color: Colors.grey[200],
      ),
      primaryColor: AppColors.buttonColor,
      brightness: Brightness.light,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.buttonColor,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      canvasColor: AppColors.white,
      cardColor: Colors.white,
      iconTheme: const IconThemeData(
        color: AppColors.textColor,
        size: 25,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false, // 1
        titleTextStyle: AppStyles.titleStyle(color: AppColors.textColor).copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textColor,
          size: 22,
        ),
        actionsIconTheme: const IconThemeData(
          color: AppColors.textColor,
          size: 22,
        ),
        color: AppColors.primary,
        elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.buttonColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hintStyle: AppStyles.hintStyle().copyWith(height: 1),
        labelStyle: AppStyles.titleStyle(color: AppColors.textColorD),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.xLargeSpacing)),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.white,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.xLargeSpacing)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.xLargeSpacing)),
          borderSide: BorderSide.none,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.xLargeSpacing)),
          borderSide: BorderSide.none,
        ),
        disabledBorder: InputBorder.none,
      ),
      colorScheme: const ColorScheme(
        primary: Color(0xFFFF8383),
        secondary: Color(0xFF4D1F7C),
        surface: Color(0xFF1F1929),
        error: Colors.redAccent,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        brightness: Brightness.light,
      ),
    );
  }

// Theme data Dark
  static ThemeData darkTheme() {
    return ThemeData(
      shadowColor: Colors.grey.withOpacity(0.025),
      textTheme: TextTheme(
        bodyMedium: AppStyles.titleStyle(color: AppColors.textColorD).copyWith(fontSize: 14),
        titleMedium: AppStyles.titleStyle(color: AppColors.textColorD),
        titleSmall: AppStyles.subTitleStyle(color: AppColors.textSubtitleD),
      ),
      dividerColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.primaryD,
      dividerTheme: DividerThemeData(
        color: Colors.grey[200],
      ),
      primaryColor: AppColors.buttonColor,
      brightness: Brightness.dark,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.buttonColor,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      canvasColor: AppColors.primaryD,
      cardColor: Colors.black,
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: 25,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false, // 1
        titleTextStyle: AppStyles.titleStyle(color: AppColors.textColorD).copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textColorD,
          size: 22,
        ),
        actionsIconTheme: const IconThemeData(
          color: AppColors.textColorD,
          size: 22,
        ),
        color: AppColors.primaryD,
        elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.buttonColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hintStyle: AppStyles.hintStyle(color: AppColors.textSubtitleD).copyWith(height: 1),
        labelStyle: AppStyles.titleStyle(color: AppColors.textColorD),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.xLargeSpacing)),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.black,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.xLargeSpacing)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.xLargeSpacing)),
          borderSide: BorderSide.none,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.xLargeSpacing)),
          borderSide: BorderSide.none,
        ),
        disabledBorder: InputBorder.none,
      ),
      colorScheme: const ColorScheme(
        primary: Color(0xFFFF8383),
        secondary: Color(0xFF4D1F7C),
        surface: Color(0xFF1F1929),
        error: Colors.redAccent,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        brightness: Brightness.dark,
      ),
    );
  }
}
