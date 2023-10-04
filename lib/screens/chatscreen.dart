import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:project_uts/screens/dmfriendlist.dart';
import 'package:project_uts/utils/colors.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key});

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
        backgroundColor: const Color(0xFF212832),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          color: const Color(0xFFFED36A),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DMFriendList(),
              ),
            );
          },
        ),
        title: const Row(
          children: [
            Icon(Icons.account_circle, color: Color(0xFFFED36A), size: 30),
            SizedBox(width: 10),
            Text(
              'Username',
              style: TextStyle(
                color: Color(0xFFFED36A),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF212832),
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
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(color: Color(0xFFFED36A)),
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
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
            IconButton(
              icon: const Icon(Icons.photo),
              onPressed: _getImage,
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {Key? key, required this.text, required this.isSent, this.image});

  final String? text;
  final bool isSent;
  final File? image;

  @override
  Widget build(BuildContext context) {
    final AlignmentGeometry alignment =
        isSent ? Alignment.topRight : Alignment.topLeft;
    final Color bubbleColor = isSent ? const Color(0xFFFED36A) : Colors.blue;
    final Color textColor = isSent ? const Color(0xFF212832) : Colors.white;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end, // Adjusted alignment
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end, // Adjusted alignment
              children: <Widget>[
                Text('User', style: Theme.of(context).textTheme.headline6),
                if (image != null)
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Image.file(
                      image!,
                      width: 150.0,
                      height: 150.0,
                    ),
                  )
                else
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
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
            margin: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(
              child: Text('User'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(ChatApp());
}
