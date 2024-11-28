// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Helpers/app_colors.dart';
import '../Helpers/common_widgets.dart';

class MembershipPage extends StatefulWidget {
  const MembershipPage({super.key});

  @override
  State<MembershipPage> createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage> {
  int selectedMembership = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.bgColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        backgroundColor: AppColors.bgColor,
        title: CommonWidgets().textWidget(
          text: "Membership",
          textColor: AppColors.whiteColor,
          textSize: 18.0,
          textWeight: FontWeight.w700,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedMembership = 1;
                });
              },
              child: Container(
                width: Get.width * 0.9,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.boxBlueColor2,
                    border: Border.all(
                        color: selectedMembership == 1
                            ? AppColors.positiveColor
                            : AppColors.boxBlueColor2),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidgets().textWidget(
                            text: "Individual",
                            textColor: AppColors.whiteColor,
                            textSize: 20.0,
                            textWeight: FontWeight.w700,
                          ),
                          CommonWidgets().textWidget(
                            text:
                                "For individuals that need advanced recording & editing.",
                            textColor: AppColors.greenColor,
                            textSize: 12.0,
                            textmaxLine: 2,
                            textoverFlow: TextOverflow.ellipsis,
                            textWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonWidgets().textWidget(
                          text: "\$9",
                          textColor: AppColors.whiteColor,
                          textSize: 20.0,
                          textWeight: FontWeight.w700,
                        ),
                        CommonWidgets().textWidget(
                          text: "Buy Now",
                          textColor: AppColors.greenColor,
                          textSize: 12.0,
                          textWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedMembership = 2;
                });
              },
              child: Container(
                width: Get.width * 0.9,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.boxBlueColor2,
                    border: Border.all(
                        color: selectedMembership == 2
                            ? AppColors.positiveColor
                            : AppColors.boxBlueColor2),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidgets().textWidget(
                            text: "Team",
                            textColor: AppColors.whiteColor,
                            textSize: 20.0,
                            textWeight: FontWeight.w700,
                          ),
                          CommonWidgets().textWidget(
                            text:
                                "For teams that need advanced sharing & reporting.",
                            textColor: AppColors.greenColor,
                            textSize: 12.0,
                            textmaxLine: 2,
                            textoverFlow: TextOverflow.ellipsis,
                            textWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonWidgets().textWidget(
                          text: "\$29",
                          textColor: AppColors.whiteColor,
                          textSize: 20.0,
                          textWeight: FontWeight.w700,
                        ),
                        CommonWidgets().textWidget(
                          text: "Buy Now",
                          textColor: AppColors.greenColor,
                          textSize: 12.0,
                          textWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedMembership = 3;
                });
              },
              child: Container(
                width: Get.width * 0.9,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.boxBlueColor2,
                    border: Border.all(
                        color: selectedMembership == 3
                            ? AppColors.positiveColor
                            : AppColors.boxBlueColor2),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidgets().textWidget(
                            text: "Professional",
                            textColor: AppColors.whiteColor,
                            textSize: 20.0,
                            textWeight: FontWeight.w700,
                          ),
                          CommonWidgets().textWidget(
                            text:
                                "For professional that need all advanced feature access.",
                            textColor: AppColors.greenColor,
                            textSize: 12.0,
                            textmaxLine: 3,
                            textoverFlow: TextOverflow.ellipsis,
                            textWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonWidgets().textWidget(
                          text: "\$49",
                          textColor: AppColors.whiteColor,
                          textSize: 20.0,
                          textWeight: FontWeight.w700,
                        ),
                        CommonWidgets().textWidget(
                          text: "Buy Now",
                          textColor: AppColors.greenColor,
                          textSize: 12.0,
                          textWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Visibility(
              visible: selectedMembership == 0 ? false : true,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 50,
                  width: Get.width * 0.5,
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: AppColors.positiveColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: CommonWidgets().textWidget(
                      text: "Process",
                      textSize: 18.0,
                      textColor: AppColors.bgColor,
                      textWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
