import 'package:flutter/material.dart';
import 'package:project_uts/responsive/renponsive_layout.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:typed_data';
import 'package:project_uts/utils/utils.dart';
import 'package:project_uts/resources/storage_methods.dart';
import 'package:provider/provider.dart';
import 'package:project_uts/model/user.dart' as model;
import 'package:project_uts/provider/user_provider.dart';
import 'package:project_uts/responsive/mobile_layout.dart';
import 'package:project_uts/responsive/web_layout.dart';
import 'package:project_uts/widgets/buildTextField.dart';
import 'package:project_uts/utils/utils.dart';

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

  //update
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    // _emailController.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

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

  void saveProfile() {
    final model.User? user =
        Provider.of<UserProvider>(context, listen: false).getUser;
    String _username2 = user!.username;
    String _bio2 = _bioController.text;
    if (_usernameController.text.isNotEmpty) {
      _username2 = _usernameController.text;
    }
    // String _email2 = _emailController.text;
    String password = _passwordController.text;
    String newPassword = _newPasswordController.text;
    updateData(_username2, _bio2, password, newPassword);
    showSnackBar('Change has been saved!', context);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ResponsiveLayout(
              webScreenLayout: WebLayout(),
              mobileScreenLayout: MobileLayout(),
            )));
  }

  void updateData(
      String username, String bio, String password, String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    final cred =
        EmailAuthProvider.credential(email: _email, password: password);
    //update pass
    user?.reauthenticateWithCredential(cred).then(
      (value) {
        user.updatePassword(newPassword).then(
          (_) {
            //Success, do something
            print('Success to change password');
          },
        ).catchError(
          (error) {
            //Error, show something
            print('Change password faied');
          },
        );
      },
    );
    //update email
    // user?.reauthenticateWithCredential(cred).then(
    //   (value) {
    //     user.updateEmail(email).then(
    //       (_) {
    //         //Success, do something
    //         print('Success to change email');
    //       },
    //     ).catchError(
    //       (error) {
    //         //Error, show something
    //         print('Change email faied');
    //       },
    //     );
    //   },
    // );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .update({'username': username, 'bio': bio});
  }

  @override
  Widget build(BuildContext context) {
    model.User? user = Provider.of<UserProvider>(context).getUser;
    if (user?.uid != null) {
      _username = user!.username;
      _bio = user!.bio;
      _email = user!.email;
      url = user!.photoUrl;
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              //spacing
              const SizedBox(
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
              const SizedBox(
                height: 35,
              ),

              //datas textfields

              buildTextField(
                  textInputType: TextInputType.text,
                  textEditingController: _usernameController,
                  labelText: "Username",
                  placeholder: _username,
                  isPasswordTextField: false),
              // buildTextField(
              //     textInputType: TextInputType.emailAddress,
              //     textEditingController: _emailController,
              //     labelText: "E-mail",
              //     placeholder: _email,
              //     isPasswordTextField: false),

              buildTextField(
                  textInputType: TextInputType.text,
                  textEditingController: _bioController,
                  labelText: "Bio",
                  placeholder: 'About me...',
                  isPasswordTextField: false),
              buildTextField(
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                  labelText: "Current Password",
                  placeholder: "********",
                  isPasswordTextField: true),
              buildTextField(
                  textInputType: TextInputType.text,
                  textEditingController: _newPasswordController,
                  labelText: "New Password",
                  placeholder: "********",
                  isPasswordTextField: true),

              //spacing

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //cancel
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        color: blueUI,
                      ),
                      child: const Text(
                        "CANCEL",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: blackUI,
                        ),
                      ),
                    ),
                  ),

                  //save
                  InkWell(
                    onTap: saveProfile,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      decoration: const ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        color: greenUI,
                      ),
                      child: const Text(
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
