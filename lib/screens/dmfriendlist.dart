import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_uts/responsive/mobile_layout.dart';
import 'package:project_uts/responsive/renponsive_layout.dart';
import 'package:project_uts/responsive/web_layout.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:project_uts/widgets/dmlist_card.dart';

class DMFriendList extends StatefulWidget {
  const DMFriendList({super.key});

  @override
  State<DMFriendList> createState() => _DMFriendListState();
}

class _DMFriendListState extends State<DMFriendList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: mobileBackgroundColor,
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
          const Divider(
            color: purpleUI,
            thickness: 4,
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: lightGreyUI,
                    ),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => DMLisCard(
                    snap: snapshot.data!.docs[index].data(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
