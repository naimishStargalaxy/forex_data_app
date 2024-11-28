// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks_app/Helpers/app_colors.dart';
import 'package:stocks_app/Helpers/common_widgets.dart';
import 'package:stocks_app/Screens/bottom_nav_bar.dart';
import 'package:stocks_app/Screens/login_page.dart';

import '../Helpers/preferance_keys.dart';
import '../Helpers/preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  TextEditingController _confirmpasscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              CommonWidgets().textWidget(
                text: "Create Account",
                textSize: 25.0,
                textColor: AppColors.whiteColor,
                textWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 20,
              ),
              CommonWidgets().textWidget(
                text:
                    "Create an account so you can explore all the existing jobs",
                textSize: 15.0,
                textAlign: TextAlign.center,
                textColor: AppColors.whiteColor,
                textWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.whiteColor,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  style: TextStyle(color: AppColors.whiteColor),
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: AppColors.whiteColor,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.whiteColor,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  style: TextStyle(color: AppColors.whiteColor),
                  controller: _passcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.whiteColor,
                      ),
                      hintText: "Password",
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.whiteColor,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  style: TextStyle(color: AppColors.whiteColor),
                  controller: _confirmpasscontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.whiteColor,
                      ),
                      hintText: "Confirm Password",
                      floatingLabelBehavior: FloatingLabelBehavior.auto),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  if (_emailcontroller.text.isEmpty ||
                      _passcontroller.text.isEmpty ||
                      _confirmpasscontroller.text.isEmpty) {
                    CommonWidgets().toast(
                        toastMsg: "Please Add Data", toastColor: Colors.red);
                  } else if (_passcontroller.text !=
                      _confirmpasscontroller.text) {
                    CommonWidgets().toast(
                        toastMsg: "Passwords Are Not Same",
                        toastColor: Colors.red);
                  } else {
                    Preference.preference
                        .saveBool(PrefernceKey.isUserVerify, true);
                    Preference.preference.saveBool(
                        PrefernceKey.isIntroductionScreenLoaded, true);
                    Get.offAll(() => AppBottomNavBar());
                  }
                },
                child: Container(
                  height: 50,
                  width: Get.width * 0.6,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: AppColors.whiteColor, width: 2)),
                  child: Center(
                    child: CommonWidgets().textWidget(
                        text: "Sign Up",
                        textColor: AppColors.bgColor,
                        textSize: 22.0,
                        textAlign: TextAlign.center,
                        textWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => LoginPage());
                },
                child: CommonWidgets().textWidget(
                  text: "Already have an account",
                  textColor: AppColors.whiteColor,
                  textSize: 12.0,
                  textWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              CommonWidgets().textWidget(
                text: "Or Continue With",
                textColor: AppColors.softGreyColor,
                textSize: 12.0,
                textWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.g_mobiledata),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.facebook),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.apple),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
