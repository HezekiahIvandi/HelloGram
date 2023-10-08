import 'package:flutter/material.dart';
import 'package:project_uts/resources/firestore_methods.dart';
import 'package:provider/provider.dart';
import 'package:project_uts/widgets/notif_get.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:intl/intl.dart';
import 'package:project_uts/model/user.dart';
import 'package:project_uts/provider/user_provider.dart';
import 'package:project_uts/screens/comment_screen.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:project_uts/widgets/like_animation.dart';

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
  bool isPostSaved = false;

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).getUser;
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
                  backgroundColor: blackUI,
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
                            "Report",
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
            onDoubleTap: () async {
              await FireStoreMethods().likePost(
                widget.snap["postId"],
                user!.uid,
                widget.snap["likes"],
              );
              setState(() {
                isLikeAnimating = true;
              });
              if (widget.snap["likes"].contains(user.uid) == false) {
                ElegantNotification(
                  width: 360,
                  height: 50,
                  notificationPosition: NotificationPosition.topCenter,
                  animation: AnimationType.fromTop,
                  background: mobileBackgroundColor,
                  description: Text(
                    '${user!.username} liked your post',
                    style: const TextStyle(color: whiteUI),
                  ),
                  icon: const Icon(
                    Icons.favorite,
                    color: redUI,
                  ),
                  showProgressIndicator: false,
                  onDismiss: () {},
                ).show(context);
                addNewNotification(context);
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Image(
                    image: NetworkImage(
                      widget.snap["photoUrl"],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikeAnimating ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: isLikeAnimating,
                    smallLike: true,
                    duration: const Duration(microseconds: 400),
                    onEnd: () {
                      setState(() {
                        isLikeAnimating = false;
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
                isAnimating: widget.snap["likes"].contains(user?.uid ?? ""),
                duration: const Duration(milliseconds: 400),
                child: IconButton(
                  onPressed: () {
                    FireStoreMethods().likePost(
                      widget.snap['postId'].toString(),
                      user?.uid ?? "",
                      widget.snap["likes"],
                    );
                    if (widget.snap["likes"].contains(user?.uid) == false) {
                      ElegantNotification(
                        width: 360,
                        height: 50,
                        notificationPosition: NotificationPosition.topCenter,
                        animation: AnimationType.fromTop,
                        background: mobileBackgroundColor,
                        description: Text(
                          '${user!.username} liked your post',
                          style: const TextStyle(color: whiteUI),
                        ),
                        icon: const Icon(
                          Icons.favorite,
                          color: redUI,
                        ),
                        showProgressIndicator: false,
                        onDismiss: () {},
                      ).show(context);
                      addNewNotification(context);
                    }
                  },
                  icon: Icon(
                    widget.snap["likes"].contains(user?.uid)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.snap["likes"].contains(user?.uid)
                        ? redUI
                        : redUI,
                    // color: Colors .red,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentScreen(snap: widget.snap),
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

void addNewNotification(BuildContext context) {
  final notif = Provider.of<Notif>(context, listen: false);
  final User? user = Provider.of<UserProvider>(context, listen: false).getUser;
  final newNotification = {
    'avatar': user?.photoUrl ?? "",
    'username': user?.username ?? "",
    'content': 'liked your post',
    'timestamp': 'Just now',
    'read': false,
  };
// Add the new notification to the beginning of the notifications list
  notif.notifications.insert(0, newNotification);
}
