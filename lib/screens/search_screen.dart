import 'package:flutter/material.dart';
import 'package:project_uts/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
        title: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Search',
            labelStyle: TextStyle(
              color: greenUI,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onFieldSubmitted: (String _) {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 10,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
                color: aquaUI,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
