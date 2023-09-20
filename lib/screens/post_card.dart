import 'package:flutter/material.dart';
import 'package:project_uts/utils/colors.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

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
                      left: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'username',
                          style: TextStyle(
                            color: yellow,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // TODO: Tambah Fungsionalitas Button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: yellow,
                  ),
                ),
              ],
            ),
          ),

          // Bagian Image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.asset(
              'assets/img/istockphoto1.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Bagian Like Comment
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: yellow,
                  // color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.comment_outlined,
                  color: yellow,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send_outlined,
                  color: yellow,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: yellow,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
