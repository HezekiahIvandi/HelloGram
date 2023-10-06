import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_uts/model/user.dart';
import 'package:project_uts/provider/user_provider.dart';
import 'package:project_uts/screens/comment_screen.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:project_uts/widgets/like_animation.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({
    super.key,
    required this.snap,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  bool isLikeAnimatingRow = false;
  bool isPostSaved = false;

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).getUser();
    return Container(
      color: mobileBackgroundColor,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          // Bagian Header
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(widget.snap['profImage']),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.snap['username'],
                          style: const TextStyle(
                            color: whiteUI,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          shrinkWrap: true,
                          children: [
                            "Remove",
                          ]
                              .map((e) => InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      child: Text(e),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: blueUI,
                  ),
                ),
              ],
            ),
          ),

          // Bagian Image
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                isLikeAnimating = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(
                      widget.snap['photoUrl'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: isLikeAnimating,
                    duration: const Duration(microseconds: 400),
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
                        isLikeAnimatingRow = true;
                      });
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: redUI,
                      size: 120,
                    ),
                  ),
                )
              ],
            ),
          ),

          // Bagian Like Comment
          Row(
            children: [
              LikeAnimation(
                isAnimating: isLikeAnimatingRow,
                duration: const Duration(milliseconds: 400),
                child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        if (isLikeAnimatingRow == false) {
                          isLikeAnimatingRow = true;
                        } else {
                          isLikeAnimatingRow = false;
                        }
                      },
                    );
                  },
                  icon: Icon(
                    isLikeAnimatingRow ? Icons.favorite : Icons.favorite_border,
                    color: isLikeAnimatingRow ? redUI : redUI,
                    // color: Colors .red,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommentScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.comment_outlined,
                  color: yellowUI,
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        shrinkWrap: true,
                        children: [
                          "Share",
                        ]
                            .map((e) => InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    child: Text(e),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.share_outlined,
                  color: greenUI,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (isPostSaved == false) {
                          isPostSaved = true;
                        } else {
                          isPostSaved = false;
                        }
                      });
                    },
                    icon: Icon(
                      isPostSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: aquaUI,
                      size: 26,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Description
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.snap["likes"].length} likes',
                  style: const TextStyle(
                    color: whiteUI,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '${widget.snap["username"]}',
                            style: const TextStyle(
                              color: whiteUI,
                              fontWeight: FontWeight.bold,
                            )),
                        TextSpan(
                            text: '  ${widget.snap["description"]}',
                            style: const TextStyle(
                              color: whiteUI,
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: const Text(
                    'View all comments',
                    style: TextStyle(
                      color: lightGreyUI,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Text(
                    DateFormat.yMMMd().format(
                      widget.snap["datePublished"].toDate(),
                    ),
                    style: const TextStyle(
                      color: lightGreyUI,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
