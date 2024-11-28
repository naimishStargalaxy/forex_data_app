// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocks_app/Helpers/app_colors.dart';
import 'package:stocks_app/Helpers/app_drawer_widget.dart';
import 'package:stocks_app/Helpers/app_images.dart';
import 'package:stocks_app/Helpers/common_widgets.dart';
import 'package:ticker_text/ticker_text.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      drawer: AppDrawerWidget().appDrawer(),
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: AppColors.bgColor,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.bgColor,
        title: CommonWidgets().textWidget(
          text: "Home",
          textColor: AppColors.whiteColor,
          textSize: 18.0,
          textWeight: FontWeight.w700,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            tickerText(),
            SizedBox(height: 20),
            cardWidget(),
            SizedBox(height: 20),
            titleBox(
              titleText: "Market Statistics",
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 120,
              width: Get.width * 0.9,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: 4,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return stockDataBoxwithChart();
                },
              ),
            ),
            SizedBox(height: 20),
            rewardBox(),
            SizedBox(height: 20),
            titleBox(
              titleText: "Recent Transactions",
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 4,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return recentList();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget tickerText() {
    return Center(
      child: Container(
        width: Get.width * 0.9,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.softGreyColor.withOpacity(0.3)),
        child: TickerText(
            scrollDirection: Axis.horizontal,
            speed: 20,
            startPauseDuration: Duration(seconds: 1),
            endPauseDuration: Duration(seconds: 1),
            returnDuration: Duration(seconds: 1),
            primaryCurve: Curves.linear,
            returnCurve: Curves.easeOut,
            child: CommonWidgets().textWidget(
                text:
                    "Market Cap 780,091 • BTC Dominance 32.11% • Cryptocurrencies 3 0903",
                textColor: AppColors.whiteColor)),
      ),
    );
  }

  Widget cardWidget() {
    return Center(
      child: Container(
        height: 150,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
            color: AppColors.softGreyColor,
            image: DecorationImage(
                image: AssetImage(AppImages.imges + "walletBg.png"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonWidgets().textWidget(
                text: "Total portfolio balance",
                textWeight: FontWeight.w500,
                textSize: 18.0,
                textColor: AppColors.whiteColor),
            SizedBox(height: 5),
            CommonWidgets().textWidget(
              text: "\$41,250",
              textColor: AppColors.whiteColor,
              textSize: 25.0,
              textWeight: FontWeight.w700,
            ),
            SizedBox(height: 10),
            CommonWidgets().textWidget(
                text: "+ \$19.25 for today",
                textColor: AppColors.positiveColor,
                textWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }

  Widget titleBox({titleText}) {
    return Container(
      width: Get.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: AppColors.boxBlueColor,
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: CommonWidgets().textWidget(
          text: titleText,
          textColor: AppColors.whiteColor,
          textWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget stockDataBoxwithChart() {
    return Container(
      width: 150,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.boxBlueColor2,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 15,
                    ),
                    CommonWidgets().textWidget(
                        text: "Bitcoin",
                        textWeight: FontWeight.w500,
                        textSize: 12.0,
                        textColor: AppColors.whiteColor)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CommonWidgets().textWidget(
                        text: "355.01 BTC",
                        textSize: 14.0,
                        textWeight: FontWeight.w600,
                        textColor: AppColors.whiteColor),
                    CommonWidgets().textWidget(
                        text: "+11.76% ^",
                        textSize: 10.0,
                        textWeight: FontWeight.w500,
                        textColor: AppColors.whiteColor)
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
            width: Get.width,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    aboveBarData: BarAreaData(show: false),
                    belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                            colors: [
                              AppColors.greenColor.withOpacity(0.2),
                              AppColors.boxBlueColor2.withOpacity(0.5)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    color: AppColors.greenColor,
                    spots: [
                      FlSpot(0, 1),
                      FlSpot(1, 3),
                      FlSpot(2, 2),
                      FlSpot(3, 4),
                      FlSpot(5, 2),
                      FlSpot(6, 4),
                      FlSpot(7, 2),
                    ],
                    isCurved: true,
                    dotData: FlDotData(show: false),
                  ),
                ],
                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    drawHorizontalLine: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rewardBox() {
    return Container(
      width: Get.width * 0.9,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.boxBlueColor3,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonWidgets().textWidget(
            text: "Refer Rewards",
            textColor: AppColors.whiteColor,
            textSize: 12.0,
            textWeight: FontWeight.w400,
          ),
          SizedBox(height: 10),
          CommonWidgets().textWidget(
            text:
                "Earn \$8.50 worth of BTC on every successful referral. Invite your friends and earn big.",
            textColor: AppColors.whiteColor,
            textSize: 14.0,
            textWeight: FontWeight.w500,
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.yellowColor)),
                child: CommonWidgets().textWidget(
                    text: "Refer a friend",
                    textColor: AppColors.whiteColor,
                    textWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }

  Widget recentList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        tileColor: AppColors.boxBlueColor2,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Icon(
          Icons.trending_up,
          color: AppColors.greenColor,
        ),
        title: CommonWidgets().textWidget(
          text: "Received",
          textColor: AppColors.whiteColor,
          textSize: 12.0,
          textWeight: FontWeight.w500,
        ),
        subtitle: CommonWidgets().textWidget(
          text: "January 10, 2001",
          textColor: AppColors.whiteColor,
          textSize: 12.0,
          textWeight: FontWeight.w400,
        ),
        trailing: CommonWidgets().textWidget(
          text: "+0.991 ETH ",
          textColor: AppColors.greenColor,
          textSize: 12.0,
          textWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
