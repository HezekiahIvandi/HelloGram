import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_uts/screens/home_screen.dart';
import 'package:project_uts/screens/log_in.dart';
import 'package:project_uts/utils/colors.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeScreen(),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: yellow,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search_outlined,
              color: yellow,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.add_circle,
              color: yellow,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.notifications_outlined,
              color: yellow,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: yellow,
            ),
            label: '',
          ),
        ],
        backgroundColor: mobileBackgroundColor,
        indicatorColor: lightGrey,
      ),
    );
  }
}
