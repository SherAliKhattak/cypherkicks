import 'package:intl/intl.dart';

class StepsDataModel {
  DateTime? time;
  int? stepsCount;

  StepsDataModel({String? time, this.stepsCount})
      : time = DateFormat('yyyy-MM-dd').parse(time!);

  factory StepsDataModel.fromJson(map) {
    return StepsDataModel(
      time: map['time'],
      stepsCount: map['stepsCount'] ?? 0,
    );
  }
  toJson() {
    return {
      "time": time.toString(),
      "stepsCount": stepsCount,
    };
  }
}

List<StepsDataModel> steps = [
  StepsDataModel(time: '2023-03-10 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-11 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-12 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-13 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-14 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-15 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-16 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-17 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-18 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-19 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-20 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-21 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-22 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-23 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-24 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-25 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-26 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-27 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-28 00:00:00.000', stepsCount: 500),
  StepsDataModel(time: '2023-03-29 00:00:00.000', stepsCount: 1111),
  StepsDataModel(time: '2023-03-30 00:00:00.000', stepsCount: 2313),
  StepsDataModel(time: '2023-03-31 00:00:00.000', stepsCount: 1124),
  StepsDataModel(time: '2023-04-01 00:00:00.000', stepsCount: 1365),
  StepsDataModel(time: '2023-04-02 00:00:00.000', stepsCount: 1265),
  StepsDataModel(time: '2023-04-03 00:00:00.000', stepsCount: 1176),
  StepsDataModel(time: '2023-04-04 00:00:00.000', stepsCount: 935),
  StepsDataModel(time: '2023-04-05 00:00:00.000', stepsCount: 458),
  StepsDataModel(time: '2023-04-06 00:00:00.000', stepsCount: 1164),
  StepsDataModel(time: '2023-04-07 00:00:00.000', stepsCount: 3551),
  StepsDataModel(time: '2023-04-08 00:00:00.000', stepsCount: 656),
  StepsDataModel(time: '2023-04-09 00:00:00.000', stepsCount: 5145),
  StepsDataModel(time: '2023-04-10 00:00:00.000', stepsCount: 2165),
  StepsDataModel(time: '2023-04-11 00:00:00.000', stepsCount: 3105),
  StepsDataModel(time: '2023-04-12 00:00:00.000', stepsCount: 3045),
  StepsDataModel(time: '2023-04-13 00:00:00.000', stepsCount: 3000),
  StepsDataModel(time: '2023-04-14 00:00:00.000', stepsCount: 2565),
  StepsDataModel(time: '2023-04-15 00:00:00.000', stepsCount: 3000),
  StepsDataModel(time: '2023-04-16 00:00:00.000', stepsCount: 1197),
  StepsDataModel(time: '2023-04-17 00:00:00.000', stepsCount: 2506),
  StepsDataModel(time: '2023-04-18 00:00:00.000', stepsCount: 2301),
  StepsDataModel(time: '2023-04-19 00:00:00.000', stepsCount: 2201),
  StepsDataModel(time: '2023-04-20 00:00:00.000', stepsCount: 1758),
  StepsDataModel(time: '2023-04-21 00:00:00.000', stepsCount: 1375),
  StepsDataModel(time: '2023-04-22 00:00:00.000', stepsCount: 1165),
  StepsDataModel(time: '2023-04-23 00:00:00.000', stepsCount: 1121),
  StepsDataModel(time: '2023-04-24 00:00:00.000', stepsCount: 443),
  StepsDataModel(time: '2023-04-25 00:00:00.000', stepsCount: 651),
  StepsDataModel(time: '2023-04-26 00:00:00.000', stepsCount: 550),
  StepsDataModel(time: '2023-04-27 00:00:00.000', stepsCount: 220),
];
