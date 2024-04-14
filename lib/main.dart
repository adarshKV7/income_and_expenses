// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:income_and_expenses/controller/home_screen_controller.dart';
import 'package:income_and_expenses/view/home_screen/home_screen.dart';
import 'package:income_and_expenses/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HomeScreenController.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
