import "package:flutter/material.dart";
import "package:project_uts/utils/colors.dart";

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(
    //     icon: Icon(Icon.upload),
    //     onPressed: () {},
    // );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: blueWhite,
          ),
          onPressed: () {},
        ),
        title: const Text(
          "New Post",
          style: TextStyle(
            color: yellow,
          ),
        ),
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Post',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ))
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1692641346524-154a0971ca2e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Write a caption...',
                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1695494009786-899a1dbe2c0d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80'),
                      fit: BoxFit.fill,
                      alignment: FractionalOffset.topCenter,
                    )),
                  ),
                ),
              ),
              const Divider(),
            ],
          )
        ],
      ),
    );
  }
}
