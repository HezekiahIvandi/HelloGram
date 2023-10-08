import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_uts/model/user.dart';
import 'package:project_uts/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:project_uts/widgets/notif_get.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'dart:io';
import 'package:project_uts/screens/dmfriendlist.dart';
import 'package:project_uts/utils/colors.dart';

class ChatScreen extends StatefulWidget {
  final String profImage;
  final String receiver;
  const ChatScreen({
    super.key,
    required this.profImage,
    required this.receiver,
  });

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      ChatMessage message = ChatMessage(
        text: null,
        isSent: true,
        image: imageFile,
      );
      setState(() {
        _messages.insert(0, message);
      });
    }
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isSent: true,
      image: null,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          color: whiteUI,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DMFriendList(),
              ),
            );
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(widget.profImage),
            ),
            const SizedBox(width: 10),
            Text(
              widget.receiver,
              style: const TextStyle(
                color: blueUI,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: mobileBackgroundColor,
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: const BoxDecoration(color: darkGreyUI),
            child: _buildTextComposer(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(color: whiteUI),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(
                  hintText: 'Send a message',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.send,
                color: aquaUI,
              ),
              onPressed: () {
                ElegantNotification(
                  width: 360,
                  height: 50,
                  notificationPosition: NotificationPosition.topCenter,
                  animation: AnimationType.fromTop,
                  background: mobileBackgroundColor,
                  description: const Text(
                    'You got a new message',
                    style: TextStyle(color: whiteUI),
                  ),
                  icon: const Icon(
                    Icons.insert_comment,
                    color: lightGreyUI,
                  ),
                  showProgressIndicator: false,
                  onDismiss: () {},
                ).show(context);
                _handleSubmitted(_textController.text);
                addNewNotification(context);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.photo,
                color: purpleUI,
              ),
              onPressed: _getImage,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.text,
    required this.isSent,
    this.image,
  });
  final String? text;
  final bool isSent;
  final File? image;

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context).getUser;
    // final AlignmentGeometry alignment =
    //     isSent ? Alignment.topRight : Alignment.topLeft;
    final Color bubbleColor = isSent ? darkGreyUI : darkGreyUI;
    final Color textColor = isSent ? whiteUI : lightGreyUI;

    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end, // Adjusted alignment
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, // Adjusted alignment
              children: <Widget>[
                Text(user?.username ?? "",
                    style: const TextStyle(
                      color: purpleUI,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                if (image != null)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Image.file(
                      image!,
                      width: 150.0,
                      height: 150.0,
                    ),
                  )
                else
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: bubbleColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        text!,
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(8, 18, 16, 8),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user?.photoUrl ?? ""),
            ),
          ),
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
    'content': 'You got a new message',
    'timestamp': 'Just now',
    'read': false,
  };
// Add the new notification to the beginning of the notifications list
  notif.notifications.insert(0, newNotification);
}
