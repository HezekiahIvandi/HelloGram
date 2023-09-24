import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_uts/screens/home_screen.dart';
import 'package:project_uts/screens/log_in.dart';
import 'package:project_uts/screens/profile.dart';
import 'package:project_uts/utils/colors.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          HomeScreen(),
          Text('Search'),
          Text('Post'),
          Text('Notification'),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? yellow : lightGrey,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search_outlined,
              color: _page == 1 ? yellow : lightGrey,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.add_circle,
              color: _page == 2 ? yellow : lightGrey,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.notifications_outlined,
              color: _page == 3 ? yellow : lightGrey,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
              color: _page == 4 ? yellow : lightGrey,
            ),
            label: '',
          ),
        ],
        onDestinationSelected: navigationTapped,
        backgroundColor: mobileBackgroundColor,
        indicatorColor: lightGrey,
        selectedIndex: _page,
      ),
    );
  }
}
