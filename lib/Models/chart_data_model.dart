// class ChartSampleData {
//   ChartSampleData({
//     this.x,
//     this.open,
//     this.close,
//     this.low,
//     this.high,
//   });

//   final dynamic x;
//   final num? open;
//   final num? close;
//   final num? low;
//   final num? high;
// }

// List<ChartSampleData> getChartData() {
//   return <ChartSampleData>[
//     ChartSampleData(
//         x: DateTime(2016, 01, 11),
//         open: 98.97,
//         high: 101.19,
//         low: 95.36,
//         close: 97.13),
//     ChartSampleData(
//         x: DateTime(2016, 01, 18),
//         open: 98.41,
//         high: 101.46,
//         low: 93.42,
//         close: 101.42),
//     ChartSampleData(
//         x: DateTime(2016, 01, 25),
//         open: 101.52,
//         high: 101.53,
//         low: 92.39,
//         close: 97.34),
//     ChartSampleData(
//         x: DateTime(2016, 02, 01),
//         open: 96.47,
//         high: 97.33,
//         low: 93.69,
//         close: 94.02),
//     ChartSampleData(
//         x: DateTime(2016, 02, 08),
//         open: 93.13,
//         high: 96.35,
//         low: 92.59,
//         close: 93.99),
//     ChartSampleData(
//         x: DateTime(2016, 02, 15),
//         open: 91.02,
//         high: 94.89,
//         low: 90.61,
//         close: 92.04),
//     ChartSampleData(
//         x: DateTime(2016, 02, 22),
//         open: 96.31,
//         high: 98.0237,
//         low: 98.0237,
//         close: 96.31),
//     ChartSampleData(
//         x: DateTime(2016, 02, 29),
//         open: 99.86,
//         high: 106.75,
//         low: 99.65,
//         close: 106.01),
//     ChartSampleData(
//         x: DateTime(2016, 03, 07),
//         open: 102.39,
//         high: 102.83,
//         low: 100.15,
//         close: 102.26),
//     ChartSampleData(
//         x: DateTime(2016, 03, 14),
//         open: 101.91,
//         high: 106.5,
//         low: 101.78,
//         close: 105.92),
//     ChartSampleData(
//         x: DateTime(2016, 03, 21),
//         open: 105.93,
//         high: 107.65,
//         low: 104.89,
//         close: 105.67),
//     ChartSampleData(
//         x: DateTime(2016, 03, 28),
//         open: 106,
//         high: 110.42,
//         low: 104.88,
//         close: 109.99),
//     ChartSampleData(
//         x: DateTime(2016, 04, 04),
//         open: 110.42,
//         high: 112.19,
//         low: 108.121,
//         close: 108.66),
//     ChartSampleData(
//         x: DateTime(2016, 04, 11),
//         open: 108.97,
//         high: 112.39,
//         low: 108.66,
//         close: 109.85),
//     ChartSampleData(
//         x: DateTime(2016, 04, 18),
//         open: 108.89,
//         high: 108.95,
//         low: 104.62,
//         close: 105.68),
//     ChartSampleData(
//         x: DateTime(2016, 04, 25),
//         open: 105,
//         high: 105.65,
//         low: 92.51,
//         close: 93.74),
//     ChartSampleData(
//         x: DateTime(2016, 05, 02),
//         open: 93.965,
//         high: 95.9,
//         low: 91.85,
//         close: 92.72),
//     ChartSampleData(
//         x: DateTime(2016, 05, 09),
//         open: 93,
//         high: 93.77,
//         low: 89.47,
//         close: 90.52),
//     ChartSampleData(
//         x: DateTime(2016, 05, 16),
//         open: 92.39,
//         high: 95.43,
//         low: 91.65,
//         close: 95.22),
//     ChartSampleData(
//         x: DateTime(2016, 05, 23),
//         open: 95.87,
//         high: 100.73,
//         low: 95.67,
//         close: 100.35),
//     ChartSampleData(
//         x: DateTime(2016, 05, 30),
//         open: 99.6,
//         high: 100.4,
//         low: 96.63,
//         close: 97.92),
//     ChartSampleData(
//         x: DateTime(2016, 06, 06),
//         open: 97.99,
//         high: 101.89,
//         low: 97.55,
//         close: 98.83),
//     ChartSampleData(
//         x: DateTime(2016, 06, 13),
//         open: 98.69,
//         high: 99.12,
//         low: 95.3,
//         close: 95.33),
//     ChartSampleData(
//         x: DateTime(2016, 06, 20),
//         open: 96,
//         high: 96.89,
//         low: 92.65,
//         close: 93.4),
//     ChartSampleData(
//         x: DateTime(2016, 06, 27),
//         open: 93,
//         high: 96.465,
//         low: 91.5,
//         close: 95.89),
//     ChartSampleData(
//         x: DateTime(2016, 07, 04),
//         open: 95.39,
//         high: 96.89,
//         low: 94.37,
//         close: 96.68),
//     ChartSampleData(
//         x: DateTime(2016, 07, 11),
//         open: 96.75,
//         high: 99.3,
//         low: 96.73,
//         close: 98.78),
//     ChartSampleData(
//         x: DateTime(2016, 07, 18),
//         open: 98.7,
//         high: 101,
//         low: 98.31,
//         close: 98.66),
//     ChartSampleData(
//         x: DateTime(2016, 07, 25),
//         open: 98.25,
//         high: 104.55,
//         low: 96.42,
//         close: 104.21),
//     ChartSampleData(
//         x: DateTime(2016, 08, 01),
//         open: 104.41,
//         high: 107.65,
//         low: 104,
//         close: 107.48),
//     ChartSampleData(
//         x: DateTime(2016, 08, 08),
//         open: 107.52,
//         high: 108.94,
//         low: 107.16,
//         close: 108.18),
//     ChartSampleData(
//         x: DateTime(2016, 08, 15),
//         open: 108.14,
//         high: 110.23,
//         low: 108.08,
//         close: 109.36),
//     ChartSampleData(
//         x: DateTime(2016, 08, 22),
//         open: 108.86,
//         high: 109.32,
//         low: 106.31,
//         close: 106.94),
//     ChartSampleData(
//         x: DateTime(2016, 08, 29),
//         open: 106.62,
//         high: 108,
//         low: 105.5,
//         close: 107.73),
//     ChartSampleData(
//         x: DateTime(2016, 09, 05),
//         open: 107.9,
//         high: 108.76,
//         low: 103.13,
//         close: 103.13),
//     ChartSampleData(
//         x: DateTime(2016, 09, 12),
//         open: 102.65,
//         high: 116.13,
//         low: 102.53,
//         close: 114.92),
//     ChartSampleData(
//         x: DateTime(2016, 09, 19),
//         open: 115.19,
//         high: 116.18,
//         low: 111.55,
//         close: 112.71),
//     ChartSampleData(
//         x: DateTime(2016, 09, 26),
//         open: 111.64,
//         high: 114.64,
//         low: 111.55,
//         close: 113.05),
//     ChartSampleData(
//         x: DateTime(2016, 10, 03),
//         open: 112.71,
//         high: 114.56,
//         low: 112.28,
//         close: 114.06),
//     ChartSampleData(
//         x: DateTime(2016, 10, 10),
//         open: 115.02,
//         high: 118.69,
//         low: 114.72,
//         close: 117.63),
//     ChartSampleData(
//         x: DateTime(2016, 10, 17),
//         open: 117.33,
//         high: 118.21,
//         low: 113.8,
//         close: 116.6),
//     ChartSampleData(
//         x: DateTime(2016, 10, 24),
//         open: 117.1,
//         high: 118.36,
//         low: 113.31,
//         close: 113.72),
//     ChartSampleData(
//         x: DateTime(2016, 10, 31),
//         open: 113.65,
//         high: 114.23,
//         low: 108.11,
//         close: 108.84),
//     ChartSampleData(
//         x: DateTime(2016, 11, 07),
//         open: 110.08,
//         high: 111.72,
//         low: 105.83,
//         close: 108.43),
//     ChartSampleData(
//         x: DateTime(2016, 11, 14),
//         open: 107.71,
//         high: 110.54,
//         low: 104.08,
//         close: 110.06),
//     ChartSampleData(
//         x: DateTime(2016, 11, 21),
//         open: 114.12,
//         high: 115.42,
//         low: 115.42,
//         close: 114.12),
//     ChartSampleData(
//         x: DateTime(2016, 11, 28),
//         open: 111.43,
//         high: 112.465,
//         low: 108.85,
//         close: 109.9),
//     ChartSampleData(
//         x: DateTime(2016, 12, 05),
//         open: 110,
//         high: 114.7,
//         low: 108.25,
//         close: 113.95),
//     ChartSampleData(
//         x: DateTime(2016, 12, 12),
//         open: 113.29,
//         high: 116.73,
//         low: 112.49,
//         close: 115.97),
//     ChartSampleData(
//         x: DateTime(2016, 12, 19),
//         open: 115.8,
//         high: 117.5,
//         low: 115.59,
//         close: 116.52),
//     ChartSampleData(
//         x: DateTime(2016, 12, 26),
//         open: 116.52,
//         high: 118.0166,
//         low: 115.43,
//         close: 115.82),
//   ];
// }

// =======================

// To parse this JSON data, do
//
//     final liveStockDataModel = liveStockDataModelFromJson(jsonString);

import 'dart:convert';

ChartSampleData liveStockDataModelFromJson(String str) =>
    ChartSampleData.fromJson(json.decode(str));

String liveStockDataModelToJson(ChartSampleData data) =>
    json.encode(data.toJson());

class ChartSampleData {
  List<num>? c;
  List<num>? h;
  List<num>? l;
  List<num>? o;
  String? s;
  List<num>? t;
  List<num>? v;

  ChartSampleData({this.c, this.h, this.l, this.o, this.s, this.t, this.v});

  factory ChartSampleData.fromJson(Map<String, dynamic> json) =>
      ChartSampleData(
        c: json["c"] == null
            ? []
            : List<double>.from(json["c"]!.map((x) => x?.toDouble())),
        h: json["h"] == null
            ? []
            : List<double>.from(json["h"]!.map((x) => x?.toDouble())),
        l: json["l"] == null
            ? []
            : List<double>.from(json["l"]!.map((x) => x?.toDouble())),
        o: json["o"] == null
            ? []
            : List<double>.from(json["o"]!.map((x) => x?.toDouble())),
        s: json["s"],
        t: json["t"] == null ? [] : List<int>.from(json["t"]!.map((x) => x)),
        v: json["v"] == null ? [] : List<int>.from(json["v"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "c": c == null ? [] : List<dynamic>.from(c!.map((x) => x)),
        "h": h == null ? [] : List<dynamic>.from(h!.map((x) => x)),
        "l": l == null ? [] : List<dynamic>.from(l!.map((x) => x)),
        "o": o == null ? [] : List<dynamic>.from(o!.map((x) => x)),
        "s": s,
        "t": t == null ? [] : List<dynamic>.from(t!.map((x) => x)),
        "v": v == null ? [] : List<dynamic>.from(v!.map((x) => x)),
      };
}
