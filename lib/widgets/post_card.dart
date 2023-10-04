import 'package:flutter/material.dart';
import 'package:project_uts/screens/comment_screen.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:project_uts/widgets/like_animation.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLikeAnimating = false;
  bool isLikeAnimatingRow = false;
  bool isPostSaved = false;

  @override
  Widget build(BuildContext context) {
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
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/img/muka.jpg'),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'username',
                          style: TextStyle(
                            color: yellow,
                            fontWeight: FontWeight.bold,
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
                    color: yellow,
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
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/img/istockphoto1.jpg',
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
                      color: Colors.red,
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
                    color: isLikeAnimatingRow ? Colors.red : yellow,
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
                  color: yellow,
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
                  color: yellow,
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
                      color: yellow,
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
                const Text(
                  '1.234 Likes',
                  style: TextStyle(
                    color: blueWhite,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'username',
                            style: TextStyle(
                              color: blueWhite,
                            )),
                        TextSpan(
                            text:
                                '   Test Caption zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz',
                            style: TextStyle(
                              color: blueWhite,
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
                      color: lightGrey,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: const Text(
                    '21 September 2023',
                    style: TextStyle(
                      color: lightGrey,
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
