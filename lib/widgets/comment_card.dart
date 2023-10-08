import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_uts/utils/colors.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({super.key, required this.snap});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.snap["profImage"]),
            radius: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.snap["username"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: greenUI,
                          ),
                          children: const [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.baseline,
                              baseline: TextBaseline.alphabetic,
                              child: SizedBox(width: 10),
                            ),
                          ],
                        ),
                        TextSpan(
                          text: widget.snap["text"],
                          style: const TextStyle(
                            color: whiteUI,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                    ),
                    child: Text(
                      DateFormat.yMMMd()
                          .format(widget.snap["datePublished"].toDate()),
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: lightGreyUI),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (isLike == false) {
                    isLike = true;
                  } else {
                    isLike = false;
                  }
                });
              },
              icon: Icon(
                isLike ? Icons.favorite : Icons.favorite_outline,
                size: 16,
                color: redUI,
              ),
            ),
          )
        ],
      ),
    );
  }
}
