import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care/src/dashboard/dashboard_screen.dart';
import 'package:health_care/src/dashboard/setting/setting_model.dart';

import 'package:health_care/src/dashboard/water/water_model.dart';
import 'package:health_care/src/splash_screen/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
//api key AIzaSyCCP0ft2n0LTphFo-C_gl_66lVKi-DQMBc

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  print('PATH' + appDocPath);
  Hive.init(appDocPath);
  print('DONE INIt');
  Hive.registerAdapter<Water>(WaterAdapter());
  Hive.registerAdapter<SettingModel>(SettingModelAdapter());
  await Hive.openBox<Water>('dbWater');
  await Hive.openBox<SettingModel>('dbSetting');

  runApp(MyApp());
  // SharedPreferences.setMockInitialValues({});
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData.light(),
    );
  }
}
