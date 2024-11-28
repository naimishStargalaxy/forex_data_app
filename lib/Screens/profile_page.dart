// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks_app/Helpers/app_colors.dart';
import 'package:stocks_app/Helpers/app_images.dart';
import 'package:stocks_app/Screens/login_page.dart';
import 'package:stocks_app/Screens/membership_page.dart';

import '../Helpers/common_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text(
        "No",
        style: GoogleFonts.poppins(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = TextButton(
      style: ButtonStyle(
          side: WidgetStatePropertyAll(
              BorderSide(color: AppColors.bgColor, width: 1.5))),
      child: Text(
        "Yes",
        style: GoogleFonts.poppins(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onPressed: () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Get.offAll(() => LoginPage());
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Logout",
        style: GoogleFonts.poppins(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
      ),
      content: Text(
        "Are you sure for Logout?",
        style: GoogleFonts.poppins(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: AppColors.bgColor,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.bgColor,
        title: CommonWidgets().textWidget(
          text: "Profile",
          textColor: AppColors.whiteColor,
          textSize: 18.0,
          textWeight: FontWeight.w700,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            userDetails(),
            SizedBox(height: 20),
            profileTagList(
              icondata: Icons.edit,
              titleText: "Name, Email, & Phone Number",
            ),
            SizedBox(height: 10),
            profileTagList(
              icondata: Icons.lock_open,
              titleText: "Edit Passcode",
            ),
            SizedBox(height: 10),
            profileTagList(
                icondata: Icons.workspace_premium,
                titleText: "Membership",
                btnTap: () {
                  Get.to(() => MembershipPage(), fullscreenDialog: true);
                }),
            SizedBox(height: 10),
            profileTagList(
              icondata: Icons.paid_sharp,
              titleText: "Currency",
            ),
            SizedBox(height: 10),
            profileTagList(
              icondata: Icons.security,
              titleText: "2 Factor Authentication",
            ),
            SizedBox(height: 10),
            profileTagList(
              icondata: Icons.support_agent,
              titleText: "Contact Support",
            ),
            SizedBox(height: 10),
            profileTagList(
              btnTap: () {
                showAlertDialog(context);
              },
              icondata: Icons.exit_to_app,
              titleText: "Logout",
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget userDetails() {
    return Center(
      child: SizedBox(
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(AppImages.networkimges),
            ),
            SizedBox(height: 5),
            CommonWidgets().textWidget(
              text: "User Tester",
              textColor: AppColors.whiteColor,
              textWeight: FontWeight.w500,
              textSize: 16.0,
            ),
            CommonWidgets().textWidget(
              text: "User123@gmail.com",
              textColor: AppColors.softGreyColor,
              textWeight: FontWeight.w400,
              textSize: 14.0,
            )
          ],
        ),
      ),
    );
  }

  Widget profileTagList({titleText, icondata, btnTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        tileColor: AppColors.boxBlueColor2,
        onTap: btnTap,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Icon(
          icondata,
          color: AppColors.whiteColor,
        ),
        title: CommonWidgets().textWidget(
          text: titleText,
          textColor: AppColors.softGreyColor,
          textWeight: FontWeight.w500,
          textSize: 15.0,
        ),
      ),
    );
  }
}
