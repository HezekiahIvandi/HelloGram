import 'package:flutter/material.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF212832),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      color: Color(0xFFfed36a),
                      fontSize: 22,
                    ),
                  ),
                ),

          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 54,
                backgroundColor: Color(0xFF212832),
                backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/6977945/pexels-photo-6977945.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
              ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFFfed36a), // Change the color as needed
                      width: 5.0,
                    ),
                  ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BIO',
                      style: TextStyle(
                        color: Color(0xFFfed36a),
                        fontSize: 16, // Adjust the font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        width: 200, // Set the width to 200
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white, // Set the outline color to white
                            width: 1.0, // Set the outline width as needed
                          ),
                        ),
                        child: SizedBox(
                          height: 75, // TextField expands to this height.
                          child: TextField(
                            maxLines: null, // Set this
                            expands: true, // and this
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                              color: Colors.white, // Set the text color to white
                            ),
                            cursorColor: Colors.white, // Set the cursor color to white
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent), // Set the line color to transparent
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: TextField(
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF455A64),
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child:SizedBox(
                    width: 200,
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: 200,
                    height: 40,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF455A64)),
                        backgroundColor:
                        MaterialStatePropertyAll(Color(0xFFfed36a)),
                      ),
                      onPressed:() { },
                      child: Text(
                        'Setting',
                        style: TextStyle(color: Color(0xFF000000),fontSize: 21),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(130, 10, 0, 0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                        backgroundColor:  Color(0xFFfed36a)
                    ),
                    onPressed: () { },
                    child: Text('Logout',
                        style: TextStyle(color: Color(0xFF000000))
                      ),
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