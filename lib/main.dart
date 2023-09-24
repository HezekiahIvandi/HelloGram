import 'package:flutter/material.dart';
import 'package:project_uts/screens/home_screen.dart';
import 'package:project_uts/responsive/mobileLayout.dart';
import 'package:project_uts/responsive/renponsiveLayout.dart';
import 'package:project_uts/responsive/webLayout.dart';
import 'package:project_uts/screens/log_in.dart';
import 'package:project_uts/utils/colors.dart';
// import 'package:project_uts/screens/log_in.dart';
// import 'package:project_uts/screens/profile.dart';
// import 'package:project_uts/screens/sign_up.dart';
// import 'package:project_uts/screens/home_screen.dart';

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
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileLayout(),
      //   webScreenLayout: WebLayout(),
      // ),
      home: LogIn(),
    );
  }
}
