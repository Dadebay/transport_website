import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Assets {
  static const String loadingLottie = 'assets/lottie/loading.json';
  static const String noDataLottie = 'assets/lottie/noData.json';
  static const String stockManagament = 'assets/image/stock_managament.png';
}

class Fonts {
  static const String plusJakartaSansBold = 'PlusJakartaSans';
  static const String plusJakartaSansSemiBold = 'PlusJakartaSans';
  static const String plusJakartaSansMedium = 'PlusJakartaSans';
  static const String plusJakartaSansRegular = 'PlusJakartaSans';
  static const String plusJakartaSansLight = 'PlusJakartaSans';
}

class AppFontSizes {
  static double get screenWidth => Get.width;
  static double get screenHeight => Get.height;

  // 4, 6, 8 ve 10 arasındaki küçük font boyutları
  static double get fontSize4 => screenWidth * 0.0104; // 4pt
  static double get fontSize6 => screenWidth * 0.0156; // 6pt
  static double get fontSize8 => screenWidth * 0.021; // 8pt
  static double get fontSize10 => screenWidth * 0.026; // 10pt

  // 12 ve üstü font boyutları
  static double get fontSize12 => screenWidth * 0.031; // 12pt
  static double get fontSize14 => screenWidth * 0.036; // 14pt
  static double get fontSize16 => screenWidth * 0.041; // 16pt
  static double get fontSize18 => screenWidth * 0.046; // 18pt
  static double get fontSize24 => screenWidth * 0.0625; // 24pt
  static double get fontSize32 => screenWidth * 0.083; // 32pt
  static double get fontSize44 => screenWidth * 0.11; // 44pt
  static double get fontSize52 => screenWidth * 0.1354; // 52pt
}

class BorderRadii {
  static const BorderRadius borderRadius5 = BorderRadius.all(Radius.circular(5));
  static const BorderRadius borderRadius10 = BorderRadius.all(Radius.circular(10));
  static const BorderRadius borderRadius15 = BorderRadius.all(Radius.circular(15));
  static const BorderRadius borderRadius20 = BorderRadius.all(Radius.circular(20));
  static const BorderRadius borderRadius25 = BorderRadius.all(Radius.circular(25));
  static const BorderRadius borderRadius30 = BorderRadius.all(Radius.circular(30));
  static const BorderRadius borderRadius35 = BorderRadius.all(Radius.circular(35));
  static const BorderRadius borderRadius40 = BorderRadius.all(Radius.circular(40));
  static const BorderRadius borderRadius50 = BorderRadius.all(Radius.circular(50));
}

class AppColors {
  static const Color darkMainColor = Color(0xFF111218);
  static const Color darkSecondaryColor = Color(0xFF1D1E27);
  static const Color darkSecondaryButtonColor = Color(0xFF171920);
  static const Color whiteMainColor = Color(0xFFFDFEFF);
  static const Color warmWhiteColor = Color(0xFFFFEEDA);
  static const Color textColorMain = Color(0xFF474747);
  static const Color secondaryTextColor = Color(0xFF707070);
  static const Color strokeColor = Color(0xFF2A2A2F);
  static const Color mainButtonGradientStart = Color(0xFFFEA845);
  static const Color mainButtonGradientEnd = Color(0xFFA1E87E);
  static const Color brandYellow = Colors.amber;
  static const Color systemGreenGraph = Color(0xFF05B124);
  static const Color systemRedGraph = Color(0xFFD21B1E);
  static const Color errorRed = Color(0xFF7A0007);
  static const Color green = Color(0xFF05B124);
}

class AppThemes {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: Fonts.plusJakartaSansLight,
      // colorSchemeSeed: AppColors.darkMainColor,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.light,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white, // Tüm metin renklerini beyaz yap
          fontFamily: Fonts.plusJakartaSansBold,
          fontSize: 20,
        ),
        elevation: 0,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
        headlineLarge: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        labelLarge: TextStyle(color: Colors.white),
        labelMedium: TextStyle(color: Colors.white),
        labelSmall: TextStyle(color: Colors.white),
      ),

      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
