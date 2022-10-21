import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import 'Utility/CommandMethod.dart';
import 'Views/Home/HomeScreen.dart';
import 'Views/WelcomeSplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  runApp(const MyApp());
}
void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
          (rec) => {print("${rec.level.name}: ${rec.time} : ${rec.message}")});
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inventory Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF546E7A)),
        // platform: TargetPlatform.iOS
      ),
      home: WelcomeSplashScreen(),
      getPages: [
        GetPage(name: "/HomeScreen", page: () => HomeScreen()),
      ],
    );
  }
}

