// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// ignore_for_file: no_wildcard_variable_uses, prefer_const_constructors, avoid_print, depend_on_referenced_packages, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import '../Helpers/app_colors.dart';
import '../Helpers/common_widgets.dart';
import '../Models/chart_data_model.dart';

class TredingChartPage extends StatefulWidget {
  const TredingChartPage({super.key});

  @override
  State<TredingChartPage> createState() => _TredingChartPageState();
}

class _TredingChartPageState extends State<TredingChartPage> {
  // late List<ChartSampleData> _chartData;
  ChartSampleData? _chartData;
  List low = [];
  List high = [];
  List open = [];
  List close = [];
  late TrackballBehavior _trackballBehavior;

  stockDataApi() async {
    final response = await http.get(
      Uri.parse(
          "https://finnhub.io/api/v1/forex/candle?symbol=OANDA:EUR_USD&resolution=1&from=1133084124&to=1227778524&token=ct22mr1r01qoprggttbgct22mr1r01qoprggttc0"),
    );
    if (response.statusCode == 200) {
      _chartData = ChartSampleData.fromJson(jsonDecode(response.body));
      low = ChartSampleData.fromJson(jsonDecode(response.body)).l!;
      high = ChartSampleData.fromJson(jsonDecode(response.body)).h!;
      open = ChartSampleData.fromJson(jsonDecode(response.body)).o!;
      close = ChartSampleData.fromJson(jsonDecode(response.body)).c!;
      print(response.body);
      print("======low ${low}");
      print("======high ${high}");
      print("======open ${open}");
      print("======close ${close}");
      return _chartData;
    } else {
      print(response.statusCode);
      throw Exception('Not Found');
    }
  }

  @override
  void initState() {
    // _chartData = getChartData();

    _trackballBehavior = TrackballBehavior(
      enable: true,
      shouldAlwaysShow: false,
      hideDelay: 2000,
      tooltipSettings: InteractiveTooltip(
          color: AppColors.bgColor,
          textStyle: TextStyle(
            color: AppColors.yellowColor,
          )),
      lineColor: Colors.transparent,
      activationMode: ActivationMode.singleTap,
    );
    setState(() {});
    super.initState();
  }

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
            text: "Exchange Market",
            textColor: AppColors.whiteColor,
            textSize: 18.0,
            textWeight: FontWeight.w700,
          ),
        ),
        body: FutureBuilder(
          future: stockDataApi(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dataBox(),
                      priceData(),
                    ],
                  ),
                ),
                chartWidget(),
              ],
            );
          },
        ));
  }

  Widget dataBox() {
    return Container(
      width: Get.width * 0.5,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.boxBlueColor2,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CommonWidgets().textWidget(
                    text: "High",
                    textColor: AppColors.greenColor,
                    textSize: 15.0,
                    textWeight: FontWeight.w500,
                  ),
                  CommonWidgets().textWidget(
                    text: _chartData!.h!.first.toString(),
                    textColor: AppColors.whiteColor,
                    textSize: 15.0,
                    textWeight: FontWeight.w400,
                  ),
                ],
              ),
              Container(height: 20, width: 1, color: AppColors.whiteColor),
              Column(
                children: [
                  CommonWidgets().textWidget(
                    text: "Low",
                    textColor: AppColors.redColor,
                    textSize: 15.0,
                    textWeight: FontWeight.w500,
                  ),
                  CommonWidgets().textWidget(
                    text: _chartData!.l!.first.toString(),
                    textColor: AppColors.whiteColor,
                    textSize: 15.0,
                    textWeight: FontWeight.w400,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget priceData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CommonWidgets().textWidget(
          text: "\$66,360.55",
          textColor: AppColors.whiteColor,
          textSize: 22.0,
          textWeight: FontWeight.w700,
        ),
        CommonWidgets().textWidget(
          text: "(+1.25%)",
          textColor: AppColors.greenColor,
          textSize: 15.0,
          textWeight: FontWeight.w700,
        ),
      ],
    );
  }

  Widget chartWidget() {
    return Container(
      height: Get.height * 0.6,
      width: Get.width * 0.95,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.boxBlueColor2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: SfCartesianChart(
        borderColor: AppColors.boxBlueColor2,
        trackballBehavior: _trackballBehavior,
        // tooltipBehavior: _tooltipBehavior,
        zoomPanBehavior: ZoomPanBehavior(
          enablePinching: true,
          zoomMode: ZoomMode.x,
          enablePanning: true,
          maximumZoomLevel: 0.3,
        ),

        series: <CandleSeries<ChartSampleData, double>>[
          CandleSeries(
            enableSolidCandles: true,
            xValueMapper: (ChartSampleData sales, _) =>
                double.parse(sales.v.toString()),
            lowValueMapper: (low, _) => low.l!.length,
            highValueMapper: (high, _) => high.h!.length,
            openValueMapper: (open, _) => open.o!.length,
            closeValueMapper: (close, _) => close.c!.length,
          )
        ],
        // ==========================================
        // series: <CandleSeries>[
        //   CandleSeries<ChartSampleData, DateTime>(
        //     dataSource: _chartData,
        //     enableSolidCandles: true,
        //     borderRadius: BorderRadius.circular(5),
        //     xValueMapper: (ChartSampleData sales, _) => sales.x,
        //     lowValueMapper: (ChartSampleData sales, _) => sales.low!,
        //     highValueMapper: (ChartSampleData sales, _) => sales.high!,
        //     openValueMapper: (ChartSampleData sales, _) => sales.open!,
        //     closeValueMapper: (ChartSampleData sales, _) => sales.close!,
        //   ),
        // ],
        plotAreaBorderColor: Colors.transparent,
        primaryXAxis: DateTimeAxis(
          interval: 1,
          autoScrollingMode: AutoScrollingMode.start,
          axisLine: AxisLine(width: 1, color: AppColors.softGreyColor),
          labelStyle: TextStyle(color: AppColors.whiteColor),
          dateFormat: DateFormat.MMM(),
          // initialVisibleMinimum: DateTime(2016, 08, 15),
          borderColor: AppColors.bgColor,
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: NumericAxis(
          minimum: 85,
          interval: 5,
          numberFormat: NumberFormat.compact(),
          labelStyle: TextStyle(color: AppColors.whiteColor),
          majorGridLines: MajorGridLines(
              width: 0.5, color: AppColors.boxBlueColor.withOpacity(.7)),
          opposedPosition: false,
          borderColor: AppColors.bgColor,
          plotBands: [
            PlotBand(
              start: 115,
              end: 109,
              shouldRenderAboveSeries: true,
              borderColor: Colors.red.withOpacity(.5),
              color: Colors.red.withOpacity(0.2),
              borderWidth: 2,
              text: "Stop 0.0098 (0.98%) 95.8, Ammount 750",
              verticalTextAlignment: TextAnchor.start,
              horizontalTextAlignment: TextAnchor.middle,
              verticalTextPadding: "30",
              textStyle: TextStyle(
                  backgroundColor: Colors.red,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700),
            ),
            PlotBand(
              start: 100,
              end: 100,
              shouldRenderAboveSeries: true,
              color: Colors.transparent,
              text:
                  "Closed P&L 0.01437, Qty: 26012, \n Risk/Reward Ratio: 3.46",
              verticalTextAlignment: TextAnchor.middle,
              horizontalTextAlignment: TextAnchor.middle,
              textStyle: TextStyle(
                  backgroundColor: Colors.green,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700),
              borderWidth: 2,
            ),
            PlotBand(
              start: 109,
              end: 95,
              shouldRenderAboveSeries: true,
              borderColor: Colors.green.withOpacity(.5),
              color: Colors.green.withOpacity(.2),
              text: "Target: 0.03314 (3.34%) 331.4, Ammount: 1864.82",
              verticalTextAlignment: TextAnchor.end,
              horizontalTextAlignment: TextAnchor.middle,
              verticalTextPadding: "-30",
              textStyle: TextStyle(
                  backgroundColor: Colors.green,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700),
              borderWidth: 2,
            )
          ],
        ),
      ),
    );
  }
}

// ==================================================================================
