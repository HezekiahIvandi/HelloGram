import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:project_uts/screens/homescreen.dart';
import 'package:project_uts/utils/colors.dart';

import 'package:project_uts/screens/log_in.dart';
import 'package:project_uts/screens/Profile.dart';
import 'package:project_uts/screens/sign_up.dart';
=======
import 'package:project_uts/screens/home_screen.dart';
import 'package:project_uts/responsive/mobileLayout.dart';
import 'package:project_uts/responsive/renponsiveLayout.dart';
import 'package:project_uts/responsive/webLayout.dart';
import 'package:project_uts/utils/colors.dart';
// import 'package:project_uts/screens/log_in.dart';
// import 'package:project_uts/screens/profile.dart';
// import 'package:project_uts/screens/sign_up.dart';
// import 'package:project_uts/screens/home_screen.dart';
>>>>>>> 76a13b61e2a749edf48dde56dddee74cfe7030ff

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HelloGram',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
<<<<<<< HEAD
      // home: responsiveLayout(
      //   mobileScreenLayout: MobileLayout(),
      //   webScreenLayout: WebLayout(),
      // ),
      home: HomeScreen(),
=======
      home: ResponsiveLayout(
        mobileScreenLayout: MobileLayout(),
        webScreenLayout: WebLayout(),
      ),
>>>>>>> 76a13b61e2a749edf48dde56dddee74cfe7030ff
    );
  }
}
