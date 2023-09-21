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
        backgroundColor: mobileBackgroundColor,
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
      body: const PostCard(),

      // Navigation TODO: Tambah Fungsinalitas Button
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.home_outlined),
            color: yellow,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
            color: yellow,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined),
            color: yellow,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
            color: yellow,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            color: yellow,
          ),
        ],
      ),
    );
  }
}
