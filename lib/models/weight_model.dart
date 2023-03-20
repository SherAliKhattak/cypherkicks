class WeightModel {
  num? weight;
  String? dateTime;

  WeightModel({this.weight, this.dateTime});

  factory WeightModel.fromJson(map) {
    return WeightModel(
      weight: map['weight'],
      dateTime: map['dateTime'] ?? '',
    );
  }
  toJson() {
    return {
      "weight": weight,
      "dateTime": dateTime,
    };
  }
}

List<WeightModel> weights = [
  WeightModel(
    weight: 125,
    dateTime: '28 Feb 2023',
  ),
  WeightModel(
    weight: 125,
    dateTime: '3 March 2023',
  ),
  WeightModel(
    weight: 121,
    dateTime: '25 march 2023',
  ),
  WeightModel(
    weight: 120,
    dateTime: '4 April 2023',
  ),
  WeightModel(
    weight: 118,
    dateTime: '16 April 2023',
  ),
  WeightModel(
    weight: 115,
    dateTime: '18 April 2023',
  ),
  WeightModel(
    weight: 125,
    dateTime: '19 May 2023',
  ),
];
