import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:echo_booking_admin/feature/presentation/pages/screen_home/screen_home.dart';
import 'package:echo_booking_admin/feature/presentation/provider/turf_provider/turf_provider.dart';
import 'package:echo_booking_admin/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 
  runZonedGuarded(() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(MyApp());
  }, (error, stack) {
    print('Error in runZonedGuarded: $error');
  });
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>TurfProvider())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
          home: ScreenHome(initialTab: 0,),
        ),
      );
  }
}