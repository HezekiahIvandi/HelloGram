import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_uts/screens/Profile.dart';
import 'package:project_uts/screens/home_screen.dart';
import 'package:project_uts/utils/colors.dart';


class MobileLayout extends StatefulWidget {
  MobileLayout({super.key});

  @override
  _MobileLayout createState() => _MobileLayout();
}

class _MobileLayout extends State<MobileLayout>{
   int index = 0;
    //ADD screen di sini
   final screens = [
     Center(child: HomeScreen()),
     Center(child: HomeScreen()),
     Center(child: HomeScreen()),
     Center(child: HomeScreen()),
     Center(child: Profile()),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: index,
        onDestinationSelected: (index) =>
          setState(() => this.index = index),
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: yellow,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search_outlined,
              color: yellow,
            ),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.add_circle,
              color: yellow,
            ),
            label: 'Post',
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
            label: 'Profile',

          ),
        ],
      ),
    );
  }
}
