import 'package:get/get.dart';

class DashBoardController extends GetxController implements GetxService {
  int selectedIndex = 0;

  updateIndex(int index) {
    selectedIndex = index;
    update();
  }

  static DashBoardController get i => Get.put(DashBoardController());
}
