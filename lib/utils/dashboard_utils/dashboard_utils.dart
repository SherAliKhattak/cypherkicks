import '../../data/controllers/dashboard_controller.dart';
import '../../data/controllers/steps_controller.dart';

class DashBoardUtils {
  displaySteps() {
    if (DashBoardController.i.selectedIndex == 0) {
      return StepsController.i.stepcountFortoday.toString();
    } else if (DashBoardController.i.selectedIndex == 1) {
      return StepsController.i.stepcountfortheweek.toString();
    } else if (DashBoardController.i.selectedIndex == 2) {
      return StepsController.i.stepcountforthemonth.toString();
    } else if (DashBoardController.i.selectedIndex == 3) {
      return StepsController.i.stepcountfor3months.toString();
    }
  }

  displayTokens() {
    if (DashBoardController.i.selectedIndex == 0) {
      return StepsController.i.tokens.toStringAsFixed(1);
    }
    if (DashBoardController.i.selectedIndex == 1) {
      return StepsController.i.tokensfortheweek.toStringAsFixed(1);
    }
    if (DashBoardController.i.selectedIndex == 2) {
      return StepsController.i.tokensforthemonth.toStringAsFixed(1);
    }
    if (DashBoardController.i.selectedIndex == 3) {
      return StepsController.i.tokenslast3months.toStringAsFixed(1);
    }
  }

  displayDistance() {
    if (DashBoardController.i.selectedIndex == 0) {
      return StepsController.i.distance.toStringAsFixed(1);
    }
    if (DashBoardController.i.selectedIndex == 1) {
      return StepsController.i.distancelastweek.toStringAsFixed(1);
    }
    if (DashBoardController.i.selectedIndex == 2) {
      return StepsController.i.distancelastmonth.toStringAsFixed(1);
    }
    if (DashBoardController.i.selectedIndex == 3) {
      return StepsController.i.distancelast3months.toStringAsFixed(1);
    }
  }

  displayCalories() {
    if (DashBoardController.i.selectedIndex == 0) {
      return StepsController.i.caloriesBurned.toStringAsFixed(1);
    }
    if (DashBoardController.i.selectedIndex == 1) {
      return StepsController.i.caloriesBurnedlastweek.toStringAsFixed(1);
    }
    if (DashBoardController.i.selectedIndex == 2) {
      return StepsController.i.caloriesBurnedlastmonth.toStringAsFixed(1);
    }
    if (DashBoardController.i.selectedIndex == 3) {
      return StepsController.i.caloriesBurnedlast3months.toStringAsFixed(1);
    }
  }
}
