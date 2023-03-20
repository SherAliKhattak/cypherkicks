import 'package:cypherkicks/screens/sign_in_screen.dart';
import 'package:cypherkicks/utils/init.dart';
import 'package:cypherkicks/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';

import 'data/controllers/weight_controller.dart';
import 'data/local_db/local_db.dart';
import 'data/repos/steps_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  WeightController.i.weight = await PreferencesService().getWeightList();
  runApp(const MyApp());
}

requestPermission() async {
  if (await Permission.activityRecognition.isPermanentlyDenied) {
    openAppSettings();
  }
  if (await Permission.activityRecognition.isDenied) {
    Permission.activityRecognition.request();
  } else if (await Permission.activityRecognition.isGranted) {
    StepsRepo().initPlatformState();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    StepsRepo().initPlatformState();
    PreferencesService().getDailySteps();
    PreferencesService().getStepsList();
    PreferencesService().getProfileData();
    requestPermission();

    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      initialBinding: HomeBinding(),
      themeMode: ThemeMode.system,
      home: const SignIn(),
      title: 'Flutter Demo',
    );
  }
}
