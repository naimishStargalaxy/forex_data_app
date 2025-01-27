// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:stocks_app/Helpers/app_colors.dart';
import 'package:stocks_app/Helpers/app_images.dart';
import 'package:stocks_app/Helpers/common_widgets.dart';

class AppDrawerWidget {
  Widget appDrawer() {
    return Drawer(
      elevation: 0,
      backgroundColor: AppColors.bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(AppImages.networkimges),
                ),
                SizedBox(height: 10),
                CommonWidgets().textWidget(
                  text: "User Tester",
                  textSize: 18.0,
                  textAlign: TextAlign.center,
                  textColor: AppColors.whiteColor,
                  textWeight: FontWeight.w700,
                ),
                SizedBox(height: 10),
                CommonWidgets().textWidget(
                  text: "user123@gmail.com",
                  textSize: 12.0,
                  textAlign: TextAlign.center,
                  textColor: AppColors.softGreyColor,
                  textWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: AppColors.whiteColor,
            ),
            title: CommonWidgets().textWidget(
              text: "Payment Methods",
              textColor: AppColors.whiteColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.card_giftcard_sharp,
              color: AppColors.whiteColor,
            ),
            title: CommonWidgets().textWidget(
              text: "Rewards",
              textColor: AppColors.whiteColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.discount,
              color: AppColors.whiteColor,
            ),
            title: CommonWidgets().textWidget(
              text: "Offers",
              textColor: AppColors.whiteColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.pages_rounded,
              color: AppColors.whiteColor,
            ),
            title: CommonWidgets().textWidget(
              text: "Refer a Friend",
              textColor: AppColors.whiteColor,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.support_agent,
              color: AppColors.whiteColor,
            ),
            title: CommonWidgets().textWidget(
              text: "Support",
              textColor: AppColors.whiteColor,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: AppColors.redColor,
            ),
            title: CommonWidgets().textWidget(
              text: "Logout",
              textColor: AppColors.redColor,
            ),
          ),
          Divider(),
          Spacer(),
          ListTile(
            title: CommonWidgets().textWidget(
              text: "App Version",
              textColor: AppColors.whiteColor,
            ),
            subtitle: CommonWidgets().textWidget(
              text: "1.0.0",
              textColor: AppColors.softGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}
