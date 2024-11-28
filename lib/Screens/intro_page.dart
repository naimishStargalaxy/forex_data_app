// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stocks_app/Helpers/app_colors.dart';
import 'package:stocks_app/Helpers/common_widgets.dart';

import '../Helpers/preferance_keys.dart';
import '../Helpers/preferences.dart';
import 'login_page.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({super.key});

  @override
  State<IntroScreens> createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  PageController _pageController = PageController();
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: JumpingDotEffect(
                  spacing: 8,
                  dotWidth: 18,
                  dotHeight: 5,
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 1.5,
                  dotColor: Colors.white.withOpacity(0.5),
                  activeDotColor: AppColors.whiteColor),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: Get.height * 0.8,
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  selectedIndex = value;
                },
                children: [
                  pageViewWidget(
                    context: context,
                    titleText: "Multiple delivery options",
                    boxText: "Enjoy best in the market exchange rates",
                    image: "assets/1.json",
                  ),
                  pageViewWidget(
                    context: context,
                    titleText: "Find Your Intrest",
                    boxText: "Mobile money, Bank transfer, and cash pick up",
                    image: "assets/2.json",
                  ),
                  pageViewWidget(
                    context: context,
                    titleText: "Customer friendly",
                    boxText:
                        "Seamless and transparent customer experience at every step of transfer",
                    image: "assets/3.json",
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget pageViewWidget({context, boxText, image, titleText}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: Get.height * 0.4,
            margin: EdgeInsets.all(15),
            child: Lottie.asset(image, fit: BoxFit.contain),
          ),
          SizedBox(height: 20),
          CommonWidgets().textWidget(
              text: titleText,
              textColor: AppColors.whiteColor.withOpacity(0.5),
              textSize: 15.0,
              textAlign: TextAlign.center,
              textWeight: FontWeight.w700),
          SizedBox(height: 10),
          CommonWidgets().textWidget(
              text: boxText,
              textColor: AppColors.whiteColor,
              textSize: 24.0,
              textAlign: TextAlign.center,
              textWeight: FontWeight.bold),
          Spacer(),
          GestureDetector(
            onTap: () {
              if (_pageController.page == 2) {
                Get.off(() => LoginPage());
                Preference.preference
                    .saveBool(PrefernceKey.isIntroductionScreenLoaded, true);
              } else {
                _pageController.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutCubicEmphasized);
              }
            },
            child: Container(
              height: 50,
              width: Get.width * 0.6,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.whiteColor, width: 2)),
              child: Center(
                child: CommonWidgets().textWidget(
                    text: "Next",
                    textColor: AppColors.bgColor,
                    textSize: 22.0,
                    textAlign: TextAlign.center,
                    textWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
