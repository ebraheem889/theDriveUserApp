// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:the_drive/controller/cubit/Auth/rigester/cubit.dart';
import 'package:the_drive/controller/cubit/Auth/rigester/states.dart';
import 'package:the_drive/controller/cubit/Auth/signin/cubit.dart';
import 'package:the_drive/controller/cubit/drive/cubit.dart';
import 'package:the_drive/controller/localization_controller.dart';
import 'package:the_drive/controller/services/const/colors.dart';
import 'package:the_drive/controller/services/const/function.dart';
import 'package:the_drive/controller/services/helpers/bolcObserve.dart';
import 'package:the_drive/util/firebase_options.dart';
import 'package:the_drive/helper/route_hepler.dart';
import 'package:the_drive/util/app_constants.dart';
import 'package:the_drive/util/messages.dart';
import 'helper/get_di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // BlocOverrides.runZoned(
  //   () {
  //     runApp(MyApp(
  //       languages: _languages,
  //     ));
  //   },
  //   blocObserver: MyBlocObserver(),
  // );

  runApp(MyApp(
    languages: _languages,
  ));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({required this.languages, super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (localizeController) {
      return GetMaterialApp(
        title: AppConstants.APP_NAME,
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        theme: lightTheme(loacl),
        locale: localizeController.locale,
        translations: Messages(languages: widget.languages),
        fallbackLocale: Locale(AppConstants.languages[0].languageCode,
            AppConstants.languages[0].countryCode),
        initialRoute: RouteHelper.getSplashRoute(),
        getPages: RouteHelper.routes,
        transitionDuration: Duration(milliseconds: 500),
        builder: EasyLoading.init(),
      );
    });
  }
}
