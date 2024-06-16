import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mobile_otp/wrapper.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD604nopyDrHF_dNMMWMG-w44SkikSd-Rw",
      appId: "1:919297115279:android:22776131215d03ec755cfa",
      messagingSenderId: "919297115279",
      projectId: "t2xpro",
    ),
  )
  
  :await Firebase.initializeApp();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Wrapper()
    );
  }
}



