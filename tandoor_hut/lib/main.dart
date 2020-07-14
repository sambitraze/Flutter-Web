import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:tandoor_hut/login.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tandoor Hut',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CustomSplash(
        backGroundColor: Colors.black,
        imagePath: 'assets/logo.png',
        animationEffect: 'zoom-in',
        logoSize: 150,
        duration: 2500,
        type: CustomSplashType.StaticDuration,
        // home: LoginPage(),
        home: HomePage(),
      ),
    );
  }
}