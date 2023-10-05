// ignore_for_file: use_build_context_synchronously
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:project_uts/screens/log_in.dart';
import 'package:project_uts/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_uts/resources/storage_methods.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:project_uts/resources/auth_methods.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Uint8List? _image;
  final String _bio =
      'I am flexible, reliable and possess excellent time keeping skills. I am an enthusiastic, self-motivated, reliable, responsible and hard working person. I am a mature team worker and adaptable to all challenging situations.';

  void selectImage() async {
    Uint8List profilePic = await pickImage(ImageSource.gallery);
    String pfpUrl = await StorageMethods()
        .uploadImageToStorage('profilePics', profilePic, false);
    setState(() {
      _image = profilePic;
    });
  }

  void signOut() async {
    await AuthMethods().signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LogIn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: purpleUI,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(40),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: mobileBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: blackUI,
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 0.5, //extend the shadow
                      offset: Offset(
                        0.1, // Move to right 5  horizontally
                        0.1, // Move to bottom 5 Vertically
                      ),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    //circle avatar
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfZCGFDrC8YeednlJC3mhxPfg_s4Pg8u7-kf6dy88&s'),
                              ),
                        Positioned(
                            left: 80,
                            bottom: -10,
                            child: IconButton(
                              onPressed: selectImage,
                              icon: const Icon(Icons.add_a_photo),
                            )),
                      ],
                    ),

                    //username and email
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      child: const Column(
                        children: [
                          Text(
                            'Hezekiah Ivandi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'hezekiahivandi@gmail.com',
                            style: TextStyle(
                              fontSize: 13,
                              color: lightGreyUI,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //sizedbox spacing
                    const SizedBox(
                      height: 12,
                    ),
                    //followers
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '3200',
                              style: TextStyle(
                                fontSize: 25,
                                color: purpleUI,
                              ),
                            ),
                            Text(
                              'Followers',
                              style: TextStyle(
                                color: aquaUI,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            Text(
                              '3200',
                              style: TextStyle(
                                fontSize: 25,
                                color: purpleUI,
                              ),
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                color: blueUI,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    //
                  ],
                ),
              ),
              //sized box
              const SizedBox(
                height: 12,
              ),
              //about me
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'About me',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: greenUI),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      _bio.length > 210 ? _bio.substring(0, 210) + '...' : _bio,
                      style: const TextStyle(
                        fontSize: 14,
                        color: lightGreyUI,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(child: Container()),
              //button 1
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    color: darkGreyUI,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings),
                        color: yellowUI,
                      ),
                      const Text(
                        'Edit profile',
                        style: TextStyle(
                          color: yellowUI,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(child: Container()),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.chevron_right),
                        color: lightGreyUI,
                      ),
                    ],
                  ),
                ),
              ),

              //button2
              InkWell(
                onTap: signOut,
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    color: darkGreyUI,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        color: redUI,
                        onPressed: () {},
                        icon: const Icon(Icons.logout),
                      ),
                      const Text(
                        'Sign out',
                        style: TextStyle(
                          color: redUI,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
