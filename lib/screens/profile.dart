import 'package:flutter/material.dart';
import 'package:project_uts/screens/log_in.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF212832),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                        color: Color(0xFFfed36a),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 45,
                            backgroundColor: Color(0xFFfed36a),
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Color(0xFF212832),
                              backgroundImage: NetworkImage(
                                'https://images.pexels.com/photos/6977945/pexels-photo-6977945.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                              ),
                            ),
                          ),
                          Container(
                              alignment: Alignment.bottomCenter,
                              padding:
                                  const EdgeInsets.only(bottom: 20, left: 15),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: const Column(
                                      children: [
                                        Text(
                                          'Follow',
                                          style: TextStyle(
                                            color: Color(0xFFfed36a),
                                            fontSize:
                                                15, // Adjust the font size as needed
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '1000',
                                          style: TextStyle(
                                            color: Color(0xFFfed36a),
                                            fontSize:
                                                14, // Adjust the font size as needed
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: const Column(
                                      children: [
                                        Text(
                                          'Follower',
                                          style: TextStyle(
                                            color: Color(0xFFfed36a),
                                            fontSize:
                                                15, // Adjust the font size as needed
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '1000',
                                          style: TextStyle(
                                            color: Color(0xFFfed36a),
                                            fontSize:
                                                14, // Adjust the font size as needed
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: const Column(
                                      children: [
                                        Text(
                                          'Post',
                                          style: TextStyle(
                                            color: Color(0xFFfed36a),
                                            fontSize:
                                                15, // Adjust the font size as needed
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '1000',
                                          style: TextStyle(
                                            color: Color(0xFFfed36a),
                                            fontSize:
                                                14, // Adjust the font size as needed
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),

                    // CircleAvatar(
                    //   radius: 55,
                    //   backgroundColor: Color(0xFFfed36a),
                    //   child: const CircleAvatar(
                    //     radius: 50,
                    //     backgroundColor: Color(0xFF212832),
                    //     backgroundImage: NetworkImage(
                    //       'https://images.pexels.com/photos/6977945/pexels-photo-6977945.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    //     ),
                    //   ),
                    // ),

                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                      // decoration: BoxDecoration(
                      //   shape: BoxShape.circle,
                      //   border: Border.all(
                      //     color: const Color(0xFFfed36a),
                      //     // Change the color as needed
                      //     width: 5.0,
                      //   ),
                      // ),
                      // =================================================================================
                      // child: CircleAvatar(
                      //   radius: 72,
                      //   backgroundColor: Color(0xFF212832),
                      //   backgroundImage: NetworkImage(
                      //       'https://s.hdnux.com/photos/51/23/24/10827008/4/1200x0.jpg'
                      //   ),
                      // ),
                      // ==================================================================================
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Row(
                    children: [
                      Text(
                        ' Username',
                        style: TextStyle(
                          color: Color(0xFFfed36a),
                          fontSize: 16, // Adjust the font size as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        width: 300, // Set the width to 200
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFfed36a),
                            // Set the outline color to white
                            width: 1.0, // Set the outline width as needed
                          ),
                        ),
                        child: const SizedBox(
                          height: 75, // TextField expands to this height.
                          child: TextField(
                            maxLines: 3,
                            expands: false,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                              color:
                                  Colors.white, // Set the text color to white
                            ),
                            cursorColor: Colors.white,
                            // Set the cursor color to white
                            decoration: InputDecoration(
                              hintText:
                                  '1. Lorem ipsum dolor sit amet 2. Lorem ipsum dolor sit amet 3. Lorem ipsum dolor sit amet ',
                              hintStyle: TextStyle(
                                color: Color(0xFFFFFFFF),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(
                                        0xFFfed36a)), // Set the line color to transparen,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // const Padding(
                //   padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                //   child: SizedBox(
                //     width: 200,
                //     height: 40,
                //     child: TextField(
                //       style: TextStyle(
                //         color: Color(0xFFFFFFFF),
                //       ),
                //       decoration: InputDecoration(
                //         filled: true,
                //         fillColor: Color(0xFF455A64),
                //         border: OutlineInputBorder(),
                //         labelText: 'Username',
                //         labelStyle: TextStyle(
                //           color: Color(0xFFFFFFFF),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: TextField(
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF455A64),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(200, 10, 0, 0),
                  child: SizedBox(
                    width: 100,
                    height: 40,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF455A64)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Color(0xFFfed36a)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Setting',
                        style:
                            TextStyle(color: Color(0xFF000000), fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(235, 10, 0, 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFFfed36a)),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Logged Out!',
                            style: TextStyle(
                              color:
                                  Colors.white, // Set the text color to white
                            ),
                          ),
                          duration: Duration(seconds: 1),
                          backgroundColor: Color(0xFF455A64),
                        ),
                      );
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LogIn(),
                      ));
                    },
                    child: const Text('Logout',
                        style: TextStyle(color: Color(0xFF000000))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
