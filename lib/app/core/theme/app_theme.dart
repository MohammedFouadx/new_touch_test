import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData getLightTheme() {
    return ThemeData(
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColors.secondDark
        ),
        primaryColor: AppColors.mainLight,
        selectedRowColor: AppColors.containerBackgroundColor,
        accentColor: AppColors.accent,
        bottomAppBarColor: AppColors.mainLight,
        primaryColorLight: AppColors.secondLight,
        primaryColorDark: AppColors.thirdLight,
        backgroundColor: AppColors.secondLight,
        canvasColor: AppColors.mainLight,
        secondaryHeaderColor: AppColors.buttonLight,
        hintColor: AppColors.buttonLight,
        fontFamily: 'Alalamia',

        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.mainLight),


        checkboxTheme:  CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(AppColors.accent),),

        cardTheme: const CardTheme(
          color: AppColors.mainLight
        ),

        dividerTheme: const DividerThemeData(
          color: Colors.black54,
        ),
        dialogTheme: DialogTheme(
            backgroundColor: AppColors.mainLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        dialogBackgroundColor: AppColors.mainLight,
        shadowColor: Colors.grey.withOpacity(0.5),
        radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(AppColors.blackColor2)),

        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: true,
          color: AppColors.mainLight,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        scaffoldBackgroundColor: AppColors.mainLight,
        cardColor: AppColors.mainLight,
        brightness: Brightness.light,
        dividerColor: AppColors.accent.withOpacity(0.1),
        focusColor: AppColors.accent,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: AppColors.accent),
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.accent,
          secondary: AppColors.accent,
          surface: AppColors.accent,
        ),

        textTheme:  TextTheme(
          headline1: TextStyle(
              fontSize: 10.0.sp,
              color: Colors.white, fontWeight: FontWeight.w300),
          headline2: TextStyle(
              fontSize: 14.0.sp,
              color: Colors.white, fontWeight: FontWeight.w300),
          headline3: TextStyle(
              fontSize: 35.0.sp, color: Colors.black, fontWeight: FontWeight.w400),
          headline4: TextStyle(
              fontSize: 34.0.sp, color: Colors.black, fontWeight: FontWeight.w400),
          headline5: TextStyle(
              fontSize: 24.0.sp, color: Colors.black, fontWeight: FontWeight.w400),
          headline6: TextStyle(
              fontSize: 20.0.sp, color: Colors.black, fontWeight: FontWeight.w500),
          subtitle1: TextStyle(
              fontSize: 16.0.sp, color: Colors.black, fontWeight: FontWeight.w400),
          subtitle2: TextStyle(
              fontSize: 14.0.sp, color: Colors.black, fontWeight: FontWeight.w500),
          bodyText1: TextStyle(
              fontSize: 16.0.sp, color: Colors.black, fontWeight: FontWeight.w400),
          bodyText2: TextStyle(
              fontSize: 14.0.sp, color: Colors.black, fontWeight: FontWeight.w400),

          caption: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),

          overline: TextStyle(
              fontSize: 10.0.sp, color:
          Colors.grey, fontWeight: FontWeight.w400 ,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.grey,
              decorationThickness: 1.5
          ),
        ));
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
        drawerTheme: const DrawerThemeData(
            backgroundColor: AppColors.secondDark
        ),
        accentColor: AppColors.accentDark,
        selectedRowColor: AppColors.containerBackgroundColor,
        primaryColor: AppColors.mainDark,
        primaryColorLight: AppColors.secondDark,
        primaryColorDark: AppColors.secondDark,
        backgroundColor: AppColors.secondDark,
        bottomAppBarColor: AppColors.mainDark,
        canvasColor: AppColors.mainDark,
        secondaryHeaderColor: AppColors.buttonDark,
        hintColor: AppColors.mainLight2,
        fontFamily: 'light',
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.secondDark),
        checkboxTheme:  CheckboxThemeData(
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(AppColors.accent),),
        dividerTheme: const DividerThemeData(
          color: Colors.grey,
        ),
        cardTheme: const  CardTheme(
            color: AppColors.secondDark
        ),
        shadowColor: AppColors.accent.withOpacity(0.2),
        dialogTheme: DialogTheme(
            backgroundColor: AppColors.mainLight,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        dialogBackgroundColor: AppColors.mainDark,
        radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(AppColors.mainLight)),
        appBarTheme: const AppBarTheme().copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
            elevation: 0.0,
            color: AppColors.mainDark,
            centerTitle: true,
            titleTextStyle: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.mainDark,
        cardColor: AppColors.mainDark,
        applyElevationOverlayColor: true,
        dividerColor: AppColors.accent.withOpacity(0.1),
        focusColor: AppColors.accent,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.accent,
          ),
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.accent,
          surface: AppColors.secondDark,
          secondary: AppColors.accent,
        ),
        textTheme:  TextTheme(
          headline1: TextStyle(
              fontSize: 14.0.sp, color: Colors.black, fontWeight: FontWeight.w300),
          headline2: TextStyle(
              fontSize: 14.0.sp, color: Colors.black, fontWeight: FontWeight.w300),
          headline3: TextStyle(
              fontSize: 48.0.sp, color: Colors.white, fontWeight: FontWeight.w400),
          headline4: TextStyle(
              fontSize: 34.0.sp, color: Colors.white, fontWeight: FontWeight.w400),
          headline5: TextStyle(
              fontSize: 24.0.sp, color: Colors.white, fontWeight: FontWeight.w400),
          headline6: TextStyle(
              fontSize: 20.0.sp, color: Colors.white, fontWeight: FontWeight.w500),
          subtitle1: TextStyle(
              fontSize: 16.0.sp, color: Colors.white, fontWeight: FontWeight.w400),
          subtitle2: TextStyle(
              fontSize: 14.0.sp, color: Colors.white, fontWeight: FontWeight.w500),
          bodyText1: TextStyle(
              fontSize: 16.0.sp, color: Colors.white, fontWeight: FontWeight.w400),
          bodyText2: TextStyle(
              fontSize: 14.0.sp, color: Colors.white, fontWeight: FontWeight.w400),
          caption: TextStyle(
              fontSize: 12.sp, fontWeight: FontWeight.bold
          ),
          overline: TextStyle(
              fontSize: 10.0.sp, color:
          Colors.white, fontWeight: FontWeight.w400 ,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.grey,
              decorationThickness: 1.5
          ),
        ));
  }
}
