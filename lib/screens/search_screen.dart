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
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
        title: TextFormField(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide()),
            labelText: 'Search',
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onFieldSubmitted: (String _) {},
        ),
      ),
    );
  }
}
