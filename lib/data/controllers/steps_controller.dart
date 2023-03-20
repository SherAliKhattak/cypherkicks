import 'dart:developer';

import 'package:cypherkicks/components/snackbar.dart';
import 'package:cypherkicks/data/local_db/local_db.dart';
import 'package:cypherkicks/models/steps_data_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedometer/pedometer.dart';

class StepsController extends GetxController implements GetxService {
  List<StepsDataModel> stepsList = [];
  int totalSteps = 0;

  static DateTime currentDate = DateTime.now();

  String formattedCurrentDate = DateFormat('yyyy-MM-dd').format(currentDate);
  // stepData for today
  int stepcountFortoday = 0;
  // saved stepcount value in shared preferences
  int preservedvalue = 0;
  double tokens = 0;
  double distance = 0.0;
  double caloriesBurned = 0.0;
  // stepsData lastweek
  int stepcountfortheweek = 0;
  double tokensfortheweek = 0;
  double distancelastweek = 0.0;
  double caloriesBurnedlastweek = 0.0;
  // stepsData lastmonth
  int stepcountforthemonth = 0;
  double tokensforthemonth = 0;
  double distancelastmonth = 0.0;
  double caloriesBurnedlastmonth = 0.0;
  // stepsData last3months
  int stepcountfor3months = 0;
  double tokenslast3months = 0;
  double distancelast3months = 0.0;
  double caloriesBurnedlast3months = 0.0;

  updateStepscount(StepCount event) {
    totalSteps = event.steps;
    // todayStepcount
    stepcountforToday(event.steps);
    //weeklyStepsData
    stepcountfortheweek = stepcountFortoday +
        getStepsData(
          days: stepsList.length - 7,
          requiredsteps: stepcountfortheweek,
        );
    tokensfortheweek = stepcountfortheweek * 0.001;
    distancelastweek = stepcountfortheweek * 0.414 / 1000;
    caloriesBurnedlastweek = stepcountfortheweek * 0.04;
    log('The stepcount for the week is ${stepcountfortheweek.toString()}');
    //monthlySteps data
    stepcountforthemonth = stepcountFortoday +
        getStepsData(
          days: stepsList.length - 30,
          requiredsteps: stepcountforthemonth,
        );
    tokensforthemonth = stepcountforthemonth * 0.001;
    distancelastmonth = stepcountforthemonth * 0.414 / 1000;
    caloriesBurnedlastmonth = stepcountforthemonth * 0.04;
    //3 months Step data
    stepcountfor3months = stepcountFortoday +
        getStepsData(
          days: stepsList.length - 30,
          requiredsteps: stepcountfor3months,
        );
    tokenslast3months = stepcountfor3months * 0.001;
    distancelast3months = stepcountfor3months * 0.414 / 1000;
    caloriesBurnedlast3months = stepcountfor3months * 0.04;

    update();
  }

  void stepcountforToday(int steps) async {
    DateTime now = DateTime.now();
    String formatNow = DateFormat('yyyy-MM-dd').format(now);
    if (formatNow != formattedCurrentDate) {
      stepsList.add(StepsDataModel(
          stepsCount: stepcountFortoday,
          time: formattedCurrentDate.toString()));
      PreferencesService().saveStepsList(stepsList);
      PreferencesService().savedailysteps(steps);
      log('this is the stepsList saved : ${stepsList.toString()}');
      // to get the stepcounter to zero
      PreferencesService().getDailySteps();
      formattedCurrentDate = formatNow;
      update();
    }
    stepcountFortoday = steps - preservedvalue;
    tokens = stepcountFortoday * 0.001;
    distance = stepcountFortoday * 0.414 / 1000;
    caloriesBurned = stepcountFortoday * 0.04;
    log('formattedDate date is $formatNow');
    log("Number of steps on $formattedCurrentDate: $stepcountFortoday");
  }

  int getStepsData({
    int? days,
    required int requiredsteps,
  }) {
    DateTime now = DateTime.now();
    DateTime formatNow = DateTime(now.year, now.month, now.day);
    log(formatNow.toString());
    requiredsteps = 0;

    for (int i = stepsList.length - 1; i >= 0; i--) {
      StepsDataModel stepsData = stepsList[i];
      log('Stepcount for the day $i is ${stepsData.stepsCount.toString()}');
      if (i < days!) {
        break;
      }
      requiredsteps += stepsData.stepsCount!;

      log('stepsList length is ${stepsList.length.toString()}');
    }
    log('The total steps for the week are : $requiredsteps');

    return requiredsteps;
  }

  onStepcountError(error) {
    log('error is here $error');
    showSnackbar(Get.context!, '$error');
    update();
  }

  static StepsController get i => Get.put(StepsController());
}
