import 'package:flutter/material.dart';
import 'package:project_uts/responsive/renponsive_layout.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:typed_data';
import 'package:project_uts/utils/utils.dart';
import 'package:project_uts/resources/storage_methods.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:project_uts/model/user.dart' as model;
import 'package:project_uts/provider/user_provider.dart';
import 'package:project_uts/responsive/mobile_layout.dart';
import 'package:project_uts/responsive/web_layout.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  Uint8List? _image;
  String url =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfZCGFDrC8YeednlJC3mhxPfg_s4Pg8u7-kf6dy88&s';
  String _bio =
      'I am flexible, reliable and possess excellent time keeping skills. I am an enthusiastic, self-motivated, reliable, responsible and hard working person. I am a mature team worker and adaptable to all challenging situations.';
  bool isLoading = false;
  String _username = 'username';
  String _email = 'username@gmail.com';
  bool showPassword = false;

  @override
  initState() {
    super.initState();
    getPfp();
  }

  getPfp() async {
    var pfp = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      url = pfp.data()!['photoUrl'];
      print(url);
    });
  }

  void selectImage() async {
    Uint8List profilePic = await pickImage(ImageSource.gallery);
    String pfpUrl = await StorageMethods()
        .uploadImageToStorage('profilePics', profilePic, false);
    setState(() {
      _image = profilePic;
    });
  }

  @override
  Widget build(BuildContext context) {
    model.User? user = Provider.of<UserProvider>(context).getUser;
    if (user?.uid != null) {
      _username = user!.username;
      _bio = user.bio;
      _email = user.email;
      url = user.photoUrl;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
        title: const Text(
          'Edit your profile',
          style: TextStyle(
            color: purpleUI,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          color: whiteUI,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ResponsiveLayout(
                  webScreenLayout: WebLayout(),
                  mobileScreenLayout: MobileLayout(),
                ),
              ),
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              //spacing
              SizedBox(
                height: 15,
              ),

              //profile image
              Center(
                child: Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(url),
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
              ),

              //spacing
              SizedBox(
                height: 35,
              ),

              //datas textfields

              buildTextField("Username", _username, false),
              buildTextField("E-mail", _email, false),

              buildTextField("Bio", "About me.....", false),
              buildTextField("Password", "********", true),

              //spacing

              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        color: blueUI,
                      ),
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: blackUI,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        color: greenUI,
                      ),
                      child: Text(
                        "SAVE",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: blackUI,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: lightGreyUI,
            )),
      ),
    );
  }
}
