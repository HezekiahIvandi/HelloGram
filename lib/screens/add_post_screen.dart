import "dart:typed_data";

import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:project_uts/model/user.dart";
import "package:project_uts/provider/user_provider.dart";
import "package:project_uts/resources/firestore_methods.dart";
import "package:project_uts/utils/colors.dart";
import "package:project_uts/utils/utils.dart";
import "package:provider/provider.dart";

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;

  void postImage(
    String uid,
    String username,
    String profImage,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );

      if (res == "Success") {
        setState(() {
          _isLoading = false;
          _file = null;
        });
        showSnackBar("Posted!", context);
      } else {
        setState(() {
          _isLoading = false;
          _file = null;
        });
        showSnackBar(res, context);
      }
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create A Post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List? file = await pickImage(
                    ImageSource.camera,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List? file = await pickImage(
                    ImageSource.gallery,
                  );
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).getUser;

    return _file == null
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Please select the picture that you want to upload',
                  style: TextStyle(
                    color: whiteUI,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.upload,
                    color: aquaUI,
                  ),
                  onPressed: () => _selectImage(context),
                ),
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_left,
                  color: whiteUI,
                ),
                onPressed: () {
                  setState(() {
                    _file = null;
                  });
                },
              ),
              title: const Text(
                "Post to",
                style: TextStyle(
                  color: aquaUI,
                ),
              ),
              centerTitle: false,
              actions: [
                TextButton(
                    onPressed: () {
                      postImage(user!.uid, user.username, user.photoUrl);
                    },
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        color: blueUI,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ))
              ],
            ),
            body: Column(
              children: [
                _isLoading
                    ? const LinearProgressIndicator(
                        color: blueUI,
                      )
                    : Container(),
                const Divider(),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 12),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(user!.photoUrl),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
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
                          aspectRatio: 450 / 450,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: MemoryImage(_file!),
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter,
                            )),
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
