import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stock_managament_admin/app/modules/login/views/login_view.dart';
import 'package:stock_managament_admin/constants/utils.dart';
import 'package:stock_managament_admin/firebase_options.dart';

import 'constants/customWidget/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GetStorage storage = GetStorage();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Management Admin',
      theme: AppThemes.darkTheme,
      fallbackLocale: const Locale('eng'),
      locale: _getLocale(),
      translations: MyTranslations(),
      defaultTransition: Transition.fade,
      // home: const NavBarPageView(),
      home: LoginView(),
    );
  }

  Locale _getLocale() {
    final String? langCode = storage.read('langCode');
    if (langCode != null) {
      return Locale(langCode);
    } else {
      return const Locale('eng');
    }
  }
}
