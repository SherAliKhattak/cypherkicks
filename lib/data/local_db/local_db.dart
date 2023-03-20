import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cypherkicks/data/controllers/profile_controller.dart';
import 'package:cypherkicks/data/controllers/steps_controller.dart';
import 'package:cypherkicks/data/controllers/weight_controller.dart';
import 'package:cypherkicks/models/steps_data_model.dart';
import 'package:cypherkicks/models/weight_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  saveWeightListLocally(List<WeightModel> weights) async {
    final prefs = await SharedPreferences.getInstance();

    final mapList =
        WeightController.i.weight.map((weight) => weight.toJson()).toList();
    log(mapList.toString());
    prefs.setString('weight-list', jsonEncode(mapList));
  }

  getWeightList() async {
    final prefs = await SharedPreferences.getInstance();
    String? weightListStr = prefs.getString('weight-list') ?? '[]';

    List mapList = await jsonDecode(weightListStr);
    List<WeightModel> weightList =
        mapList.map<WeightModel>((map) => WeightModel.fromJson(map)).toList();

    log(weightList.toString());

    return weightList;
  }

  savedailysteps(int steps) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('stepcount', steps);
    log('stepcount value is $steps');
  }

  getDailySteps() async {
    final prefs = await SharedPreferences.getInstance();
    StepsController.i.preservedvalue = prefs.getInt('stepcount') ?? 0;
    log('Preserved Value is ${StepsController.i.preservedvalue}');
  }

  saveStepsList(List<StepsDataModel> list) async {
    final prefs = await SharedPreferences.getInstance();
    List mapList = list.map((list) => list.toJson()).toList();
    log(mapList.toString());
    prefs.setString('steps', jsonEncode(mapList));
  }

  getStepsList() async {
    final prefs = await SharedPreferences.getInstance();
    String? stepsListstr = prefs.getString('steps') ?? '[]';
    List mapList = await jsonDecode(stepsListstr);
    log('the maplist is $mapList');
    StepsController.i.stepsList = mapList
        .map<StepsDataModel>((map) => StepsDataModel.fromJson(map))
        .toList();
    log("this is stepsList ${StepsController.i.stepsList.toString()}");
  }

  saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('image', ProfileController.i.file!.path);
    prefs.setString('nickname', ProfileController.i.nickname.text);
    prefs.setString('address', ProfileController.i.address.text);
    prefs.setString('username', ProfileController.i.username.text);
    prefs.setString('country', ProfileController.i.country.text);
  }

  getProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    String? file = prefs.getString('image');
    log(file.toString());
    ProfileController.i.nickname.text = prefs.getString('nickname') ?? '';
    ProfileController.i.address.text = prefs.getString('address') ?? '';
    ProfileController.i.username.text = prefs.getString('username') ?? '';
    ProfileController.i.country.text = prefs.getString('country') ?? '';
    ProfileController.i.file = File(file!);
  }
}
