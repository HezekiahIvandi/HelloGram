import 'package:flutter/material.dart';
import 'package:project_uts/screens/add_post_screen.dart';
import 'package:project_uts/screens/home_screen.dart';
import 'package:project_uts/screens/notifications_screen.dart';
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
            icon: _page == 0
                ? const Icon(
                    Icons.home,
                    color: yellowUI,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: yellowUI,
                  ),
            label: '',
          ),
          NavigationDestination(
            icon: _page == 1
                ? const Icon(
                    Icons.search,
                    color: greenUI,
                  )
                : const Icon(
                    Icons.search_outlined,
                    color: greenUI,
                  ),
            label: '',
          ),
          NavigationDestination(
            icon: _page == 2
                ? const Icon(
                    Icons.add_circle,
                    color: aquaUI,
                  )
                : const Icon(
                    Icons.add_circle_outline,
                    color: aquaUI,
                  ),
            label: '',
          ),
          NavigationDestination(
            icon: _page == 3
                ? const Icon(
                    Icons.notifications,
                    color: blueUI,
                  )
                : const Icon(
                    Icons.notifications_outlined,
                    color: blueUI,
                  ),
            label: '',
          ),
          NavigationDestination(
            icon: _page == 4
                ? const Icon(
                    Icons.person,
                    color: purpleUI,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: purpleUI,
                  ),
            label: '',
          ),
        ],
        onDestinationSelected: navigationTapped,
        backgroundColor: mobileBackgroundColor,
        indicatorColor: greyUI,
        selectedIndex: _page,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 60,
      ),
    );
  }
}
