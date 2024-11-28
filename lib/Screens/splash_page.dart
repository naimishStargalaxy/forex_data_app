// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks_app/Helpers/app_colors.dart';
import 'package:stocks_app/Helpers/app_images.dart';
import 'package:stocks_app/Helpers/common_widgets.dart';
import 'package:stocks_app/Screens/intro_page.dart';
import 'package:stocks_app/Screens/login_page.dart';

import '../Helpers/preferance_keys.dart';
import '../Helpers/preferences.dart';
import 'bottom_nav_bar.dart';

class FirstSplashPage extends StatefulWidget {
  const FirstSplashPage({super.key});

  @override
  State<FirstSplashPage> createState() => _FirstSplashPageState();
}

class _FirstSplashPageState extends State<FirstSplashPage> {
  @override
  void initState() {
    Timer(Duration(microseconds: 500), () async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => SplashPage()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.imges + "background.png"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonWidgets().textWidget(
              text: "App Logo",
              textColor: AppColors.whiteColor,
              textSize: 20.0,
              textWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () async {
      var isIntroduction = await Preference.preference
          .getBool(key: PrefernceKey.isIntroductionScreenLoaded, defVal: false);
      var isCurrencyLoaded = await Preference.preference
          .getBool(key: PrefernceKey.isUserVerify, defVal: false);
      if (isIntroduction == false && isCurrencyLoaded == false) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => IntroScreens()));
      } else if (isIntroduction == true && isCurrencyLoaded == false) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      } else if (isIntroduction == true && isCurrencyLoaded == true) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => AppBottomNavBar()));
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.imges + "background.png"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonWidgets().textWidget(
              text: "App Logo",
              textColor: AppColors.whiteColor,
              textSize: 20.0,
              textWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}
