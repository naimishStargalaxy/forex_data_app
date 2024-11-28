// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:stocks_app/Helpers/app_colors.dart';
import 'package:stocks_app/Screens/home_page.dart';
import 'package:stocks_app/Screens/profile_page.dart';
import 'package:stocks_app/Screens/treding_chart_page.dart';

class AppBottomNavBar extends StatefulWidget {
  @override
  _AppBottomNavBarState createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    HomePageView(),
    TredingChartPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor.withOpacity(0.6),
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: AppColors.bgColor,
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            activeColor: AppColors.whiteColor,
            icon: Icon(
              Icons.home_filled,
              color: AppColors.whiteColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: AppColors.whiteColor,
              ),
            ),
          ),
          FlashyTabBarItem(
            activeColor: AppColors.whiteColor,
            icon: Icon(
              Icons.area_chart,
              color: AppColors.whiteColor,
            ),
            title: Text(
              'Treding',
              style: TextStyle(
                color: AppColors.whiteColor,
              ),
            ),
          ),
          FlashyTabBarItem(
            activeColor: AppColors.whiteColor,
            icon: Icon(
              Icons.person_3,
              color: AppColors.whiteColor,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
