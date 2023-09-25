import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:project_uts/widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: mobileBackgroundColor,
          elevation: 0,
          centerTitle: false,
          title: SvgPicture.asset(
            'assets/logo/vector/default-monochrome.svg', // Logo
            height: 28,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.message_outlined,
                color: yellow,
              ),
            ),
          ],
        ),
        body: ListView(
          children: const [
            PostCard(),
            PostCard(),
            PostCard(),
            PostCard(),
          ],
        ));
  }
}
