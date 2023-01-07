import 'package:biz_link/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'others/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (BuildContext context, Orientation orientation, deviceType) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      return GetMaterialApp(
        theme: ThemeData(
          primaryColor: MyColor.accent_color,
          colorScheme: ColorScheme(
            primary: MyColor.accent_color,
            secondary: MyColor.soft_accent_color,
            surface: Colors.white,
            background: Colors.white,
            error: Colors.red,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.grey,
            onBackground: Colors.grey,
            onError: Colors.red,
            brightness: Brightness.light,
          ),
          iconTheme: IconThemeData(
            color: MyColor.accent_color,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: MyColor.accent_color,
            centerTitle: false,
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColor.accent_color,
              // foregroundColor: Colors.black,
              animationDuration: const Duration(milliseconds: 1000),
              shadowColor: Colors.black38,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              // fixedSize: const Size(100,30),
              minimumSize: Size(80.w, 50),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    });
  }
}
