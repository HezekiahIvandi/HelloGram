import 'package:flutter/material.dart';
import 'package:project_uts/utils/colors.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 160, 0, 50),
                child: Text(
                  'HelloGram',
                  style: TextStyle(
                    color: yellow,
                    fontSize: 36,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: SizedBox(
                  width: 250,
                  height: 60,
                  child: TextField(
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: lightGrey,
                      border: OutlineInputBorder(),
                      labelText: 'Username or Email',
                      labelStyle: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                height: 60,
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: lightGrey,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: SizedBox(
                  width: 250,
                  height: 40,
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(lightGrey),
                      backgroundColor: MaterialStatePropertyAll(yellow),
                    ),
                    onPressed: null,
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Color(0xFF000000)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  "Don't have an account? Sign Up Here",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
