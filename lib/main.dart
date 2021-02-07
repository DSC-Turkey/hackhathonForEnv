import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forenvironment/constants/theme_data.dart';
import 'package:forenvironment/screens/login_page.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FOR-ENV',
      theme: mainThemeData,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splash: Image.asset("assets/recycle.png"),
        nextScreen: LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.green.shade500);
  }
}
