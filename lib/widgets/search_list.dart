import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SearchList extends StatefulWidget {
  final snap;
  const SearchList({super.key, required this.snap});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.snap["username"],
        style: const TextStyle(
          color: yellowUI,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        widget.snap["bio"].length > 20
            ? widget.snap["bio"].substring(0, 20) + "..."
            : widget.snap["bio"],
        style: const TextStyle(
          color: lightGreyUI,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: blackUI,
        backgroundImage: NetworkImage(widget.snap["photoUrl"]),
        radius: 24,
      ),
    );
  }
}
