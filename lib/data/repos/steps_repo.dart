import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cypherkicks/data/controllers/steps_controller.dart';
import 'package:pedometer/pedometer.dart';

class StepsRepo {
  late Stream<StepCount> _stepCountStream;

  void initPlatformState() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream
        .listen(StepsController.i.updateStepscount)
        .onError(StepsController.i.onStepcountError);
  }

  DateTime? toDateTime(dynamic dateValue) {
    if (dateValue is DateTime) {
      return dateValue;
    } else if (dateValue is String) {
      return DateTime.parse(dateValue);
    } else if (dateValue is Timestamp) {
      return dateValue.toDate();
    } else {
      return null;
    }
  }
}
