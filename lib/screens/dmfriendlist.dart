import 'package:flutter/material.dart';
import 'package:project_uts/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Color(0xFF212832),
            appBar: AppBar(
              title: Text(
                'Direct Messages',
                style: TextStyle(
                  color: Color(0xFFFED36A),
                ),
              ),
              centerTitle: true,
              leading:
                  Icon(Icons.keyboard_arrow_left, color: Color(0xFFFED36A)),
              actions: <Widget>[
                Icon(Icons.list, color: Color(0xFFFED36A), size: 30),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.create, color: Color(0xFFFED36A), size: 30),
              ],
              backgroundColor: Color(0xFF212832),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 35,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF263238),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.search, color: Color(0xFFFED36A)),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Search',
                              style: TextStyle(
                                color: Color(0xFFFED36A),
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.calendar_view_day, color: Color(0xFFFED36A)),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(20),
                      child: Row(children: <Widget>[
                        Text(
                          'Primary',
                          style: TextStyle(
                              color: Color(0xFFFED36A),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'General',
                          style: TextStyle(
                              color: Color(0xFFFED36A),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                  Divider(
                    color: Color(0xFFFED36A),
                  ),
                  ListTile(
                    title: Text(
                      'atlan.22',
                      style: TextStyle(
                          color: Color(0xFFFED36A),
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Active 2h ago',
                      style: TextStyle(
                        color: Color(0xFFFED36A),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF6564f3),
                      radius: 30,
                    ),
                    trailing:
                        Icon(Icons.camera_alt, size: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      'hezekiahivandi',
                      style: TextStyle(
                          color: Color(0xFFFED36A),
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Active 3h ago',
                      style: TextStyle(
                        color: Color(0xFFFED36A),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF0245f1),
                      radius: 30,
                    ),
                    trailing:
                        Icon(Icons.camera_alt, size: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      'devin.sprta',
                      style: TextStyle(
                          color: Color(0xFFFED36A),
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Active 5m ago',
                      style: TextStyle(
                        color: Color(0xFFFED36A),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF4d8584),
                      radius: 30,
                    ),
                    trailing:
                        Icon(Icons.camera_alt, size: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      'jonatanputragunawan',
                      style: TextStyle(
                          color: Color(0xFFFED36A),
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Active',
                      style: TextStyle(
                        color: Color(0xFFFED36A),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF8a5354),
                      radius: 30,
                    ),
                    trailing:
                        Icon(Icons.camera_alt, size: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      'albert.2093',
                      style: TextStyle(
                          color: Color(0xFFFED36A),
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Active 30m ago',
                      style: TextStyle(
                        color: Color(0xFFFED36A),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFa59d27),
                      radius: 30,
                    ),
                    trailing:
                        Icon(Icons.camera_alt, size: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      'jonathnch',
                      style: TextStyle(
                          color: Color(0xFFFED36A),
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Active 7m ago',
                      style: TextStyle(
                        color: Color(0xFFFED36A),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFF8bfbb0),
                      radius: 30,
                    ),
                    trailing:
                        Icon(Icons.camera_alt, size: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )));
  }
}
