import 'package:flutter/material.dart';
import 'package:ozon_store/utils/theme/custom_theme/appbar_theme.dart';
import 'package:ozon_store/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:ozon_store/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:ozon_store/utils/theme/custom_theme/chip.dart';
import 'package:ozon_store/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:ozon_store/utils/theme/custom_theme/outlined_button_theme.dart';
import 'package:ozon_store/utils/theme/custom_theme/text_field_theme.dart';
import 'package:ozon_store/utils/theme/custom_theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: AppCheckBoxTheme.lightCheckboxTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.lightTextFieldTheme,
  );
  
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: AppCheckBoxTheme.darkCheckboxTheme,
    chipTheme: AppChipTheme.darkChipTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.darkTextFieldTheme,
  );
}
