import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:project_uts/widgets/dmlist_card.dart';
import 'package:project_uts/widgets/search_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // final List<Map<String, dynamic>> searchUsers = [
  //   {
  //     'profileImageUrl':
  //     'https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg',
  //     'username': 'johndoe',
  //     'fullName': 'John Doe',
  //   },
  //   {
  //     'profileImageUrl':
  //     'https://cdn.pixabay.com/photo/2017/09/26/17/34/ballet-2789416_640.jpg',
  //     'username': 'janedoe',
  //     'fullName': 'Jane Doe',
  //   },
  //   {
  //     'profileImageUrl':
  //     'https://cdn.pixabay.com/photo/2019/05/28/05/06/female-4234344_640.jpg',
  //     'username': 'mikebrown',
  //     'fullName': 'Mike Brown',
  //   },
  //   {
  //     'profileImageUrl':
  //     'https://cdn.pixabay.com/photo/2016/10/20/08/36/woman-1754895_640.jpg',
  //     'username': 'emilyjones',
  //     'fullName': 'Emily Jones',
  //   },
  //   {
  //     'profileImageUrl':
  //     'https://cdn.pixabay.com/photo/2019/07/25/10/43/ballerina-4362282_640.jpg',
  //     'username': 'alexsmith',
  //     'fullName': 'Alex Smith',
  //   },
  //   {
  //     'profileImageUrl':
  //     'https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg',
  //     'username': 'sarahwilliams',
  //     'fullName': 'Sarah Williams',
  //   },
  //   {
  //     'profileImageUrl':
  //     'https://cdn.pixabay.com/photo/2016/07/08/23/17/girl-1505407_640.jpg',
  //     'username': 'davidlee',
  //     'fullName': 'David Lee',
  //   },
  //   {
  //     'profileImageUrl':
  //     'https://cdn.pixabay.com/photo/2023/01/01/16/35/street-7690347_640.jpg',
  //     'username': 'laurajohnson',
  //     'fullName': 'Laura Johnson',
  //   },
  //
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mobileBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: mobileBackgroundColor,
        elevation: 0,
        title: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Search',
            labelStyle: TextStyle(
              color: greenUI,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onFieldSubmitted: (String _) {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 10,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_outlined,
                color: aquaUI,
              ),
            ),
          ),
        ],
      ),
      // body: ListView.builder(
      //     itemCount: searchUsers.length,
      //     itemBuilder: (context, index) {
      //       var data = searchUsers[index];
      //       return ListTile(
      //         leading: CircleAvatar(
      //           radius: 24,
      //           backgroundImage: NetworkImage(data['profileImageUrl']),
      //         ),
      //         title: Text(data['username']),
      //         subtitle: Text(data['fullName']),
      //       );
      //     }),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
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
            itemBuilder: (context, index) => SearchList(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
