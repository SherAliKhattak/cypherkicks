import 'package:cypherkicks/models/weight_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WeightController extends GetxController implements GetxService {
  List<WeightModel> weight = [];
  static DateTime currentTime = DateTime.now();
  String formattedDate = DateFormat('dd MMM yyyy').format(currentTime);

  static WeightController get i => Get.put(WeightController());
}
