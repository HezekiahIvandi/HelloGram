import 'package:flutter/material.dart';
import 'package:project_uts/screens/add_post_screen.dart';
import 'package:project_uts/screens/home_screen.dart';
import 'package:project_uts/screens/notifications_screen.dart';
// import 'package:project_uts/screens/post_screen.dart';
import 'package:project_uts/screens/profile.dart';
import 'package:project_uts/screens/search_screen.dart';
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
      backgroundColor: mobileBackgroundColor,
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          HomeScreen(),
          SearchScreen(),
          AddPostScreen(),
          NotificationScreen(),
          Profile(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? yellow : blueWhite,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search,
              color: _page == 1 ? yellow : blueWhite,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.add_circle,
              color: _page == 2 ? yellow : blueWhite,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.notifications,
              color: _page == 3 ? yellow : blueWhite,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: _page == 4 ? yellow : blueWhite,
            ),
            label: '',
          ),
        ],
        onDestinationSelected: navigationTapped,
        backgroundColor: mobileBackgroundColor,
        indicatorColor: lightGrey,
        selectedIndex: _page,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 60,
      ),
    );
  }
}
