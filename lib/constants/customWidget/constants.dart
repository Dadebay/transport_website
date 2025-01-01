import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Assets {
  static const String loadingLottie = 'assets/lottie/loading.json';
  static const String noDataLottie = 'assets/lottie/noData.json';
  static const String logo = 'assets/icons/logo-2.svg';
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

  static double getFontSize(double baseSize) {
    return screenWidth * baseSize / 100;
  }

  static double get fontSize1 => getFontSize(0.26); // 1pt
  static double get fontSize2 => getFontSize(0.52); // 2pt
  static double get fontSize3 => getFontSize(0.78); // 3pt
  static double get fontSize4 => getFontSize(1.04); // 4pt
  static double get fontSize6 => getFontSize(1.56); // 6pt
  static double get fontSize8 => getFontSize(2.1); // 8pt
  static double get fontSize10 => getFontSize(2.6); // 10pt
  static double get fontSize12 => getFontSize(3.1); // 12pt
  static double get fontSize14 => getFontSize(3.6); // 14pt
  static double get fontSize16 => getFontSize(4.1); // 16pt
  static double get fontSize18 => getFontSize(4.6); // 18pt
  static double get fontSize24 => getFontSize(6.25); // 24pt
  static double get fontSize32 => getFontSize(8.3); // 32pt
  static double get fontSize44 => getFontSize(11); // 44pt
  static double get fontSize52 => getFontSize(13.54); // 52pt
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
  static const Color blue = Color(0xff1A237E);
  static const Color darkBlue = Color.fromARGB(255, 14, 23, 127);
  static const Color whiteBlue = Color(0xff3038ae);
  static final Color defaultCardColor = const Color(0xff1A239E);
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
          color: AppColors.whiteMainColor, // Tüm metin renklerini beyaz yap
          fontFamily: Fonts.plusJakartaSansBold,
          fontSize: 20,
        ),
        elevation: 0,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
