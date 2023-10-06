import 'package:flutter/material.dart';
import 'package:project_uts/responsive/mobile_layout.dart';
import 'package:project_uts/responsive/renponsive_layout.dart';
import 'package:project_uts/responsive/web_layout.dart';
import 'package:project_uts/screens/chatscreen.dart';
import 'package:project_uts/utils/colors.dart';

class DMFriendList extends StatefulWidget {
  const DMFriendList({super.key});

  @override
  State<DMFriendList> createState() => _DMFriendListState();
}

class _DMFriendListState extends State<DMFriendList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: mobileBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Direct Messages',
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
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.format_list_bulleted,
                color: blueUI,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
          backgroundColor: mobileBackgroundColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                padding: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  color: darkGreyUI,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: lightGreyUI,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(
                    color: whiteUI,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(20),
                  child: const Row(children: <Widget>[
                    Text(
                      'Primary',
                      style: TextStyle(
                          color: whiteUI,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'General',
                      style: TextStyle(
                          color: whiteUI,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ])),
              const Divider(
                color: whiteUI,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: const ListTile(
                  title: Text(
                    'atlan.22',
                    style:
                        TextStyle(color: whiteUI, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Active 2h ago',
                    style: TextStyle(
                      color: whiteUI,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF6564f3),
                    radius: 30,
                  ),
                  trailing: Icon(Icons.camera_alt, size: 30, color: whiteUI),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: const ListTile(
                  title: Text(
                    'hezekiahivandi',
                    style:
                        TextStyle(color: whiteUI, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Active 3h ago',
                    style: TextStyle(
                      color: whiteUI,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF0245f1),
                    radius: 30,
                  ),
                  trailing:
                      Icon(Icons.camera_alt, size: 30, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: const ListTile(
                  title: Text(
                    'devin.sprta',
                    style:
                        TextStyle(color: whiteUI, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Active 5m ago',
                    style: TextStyle(
                      color: whiteUI,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF4d8584),
                    radius: 30,
                  ),
                  trailing:
                      Icon(Icons.camera_alt, size: 30, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: const ListTile(
                  title: Text(
                    'jonatanputragunawan',
                    style:
                        TextStyle(color: whiteUI, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Active',
                    style: TextStyle(
                      color: whiteUI,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF8a5354),
                    radius: 30,
                  ),
                  trailing:
                      Icon(Icons.camera_alt, size: 30, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: const ListTile(
                  title: Text(
                    'albert.2093',
                    style:
                        TextStyle(color: whiteUI, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Active 30m ago',
                    style: TextStyle(
                      color: whiteUI,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFFa59d27),
                    radius: 30,
                  ),
                  trailing:
                      Icon(Icons.camera_alt, size: 30, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatScreen(),
                    ),
                  );
                },
                child: const ListTile(
                  title: Text(
                    'jonathnch',
                    style:
                        TextStyle(color: whiteUI, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Active 7m ago',
                    style: TextStyle(
                      color: whiteUI,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Color(0xFF8bfbb0),
                    radius: 30,
                  ),
                  trailing:
                      Icon(Icons.camera_alt, size: 30, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
