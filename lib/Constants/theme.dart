import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData get theme {
    return ThemeData(
        primaryColor: Color.fromRGBO(226, 55, 68, 1),
        scaffoldBackgroundColor: Color.fromRGBO(255, 255 , 255, 10),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromRGBO(226, 55, 68, 1),
        ),

        appBarTheme: AppBarTheme(
            surfaceTintColor:Color.fromRGBO(255, 255 , 255, 10),
            backgroundColor:Color.fromRGBO(255, 255 , 255, 10),
            centerTitle: true,
            titleTextStyle:
            GoogleFonts.aBeeZee(fontSize: 26.sp, color: Colors.white)),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromRGBO(226, 55, 68, 1),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(226, 55, 68, 1),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.bebasNeue(
            textStyle: TextStyle(color: Colors.white, fontSize: 45.sp),
          ),
          // titleMedium:  GoogleFonts.bebasNeue(
          //   textStyle: TextStyle(color: Colors.white, fontSize: 25.sp),
          // ),
          headlineMedium: GoogleFonts.openSans(
            textStyle: TextStyle(color: Colors.white, fontSize: 22.sp),
          ),
          bodyLarge: GoogleFonts.openSans(
            textStyle: TextStyle(color:  Colors.red, fontSize: 16.sp),
          ),
          bodyMedium: GoogleFonts.openSans(
            textStyle: TextStyle(color: Colors.white70, fontSize: 14.sp),
          ),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }));
  }
}
