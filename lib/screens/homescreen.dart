import 'package:flutter/material.dart';
import 'package:project_uts/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'HelloGram',
                    style: TextStyle(
                      color: yellow,
                      fontSize: 24,
                    ),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Image.asset('assets/img/message.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Column(
                children: [
                  Image.asset('assets/img/muka.jpg'),
                  IconButton(
                    onPressed: null,
                    icon: Image.asset('assets/img/comment.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
