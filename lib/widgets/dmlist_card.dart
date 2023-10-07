import 'package:flutter/material.dart';
import 'package:project_uts/screens/chatscreen.dart';
import 'package:project_uts/utils/colors.dart';

class DMLisCard extends StatefulWidget {
  final snap;

  const DMLisCard({
    super.key,
    required this.snap,
  });

  @override
  State<DMLisCard> createState() => _DMLisCardState();
}

class _DMLisCardState extends State<DMLisCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                  profImage: widget.snap["photoUrl"],
                  receiver: widget.snap["username"]),
            ),
          );
        },
        child: ListTile(
          title: Text(
            widget.snap["username"],
            style: const TextStyle(
              color: blueUI,
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
            radius: 30,
          ),
          trailing: const Icon(Icons.camera_alt, size: 30, color: aquaUI),
        ),
      ),
    );
  }
}
