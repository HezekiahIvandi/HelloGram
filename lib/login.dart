import 'package:flutter/material.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

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
                  padding: EdgeInsets.fromLTRB(0, 160, 0, 50),
                  child: Text(
                    'HelloGram',
                    style: TextStyle(
                      color: Color(0xFFfed36a),
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
                        fillColor: Color(0xFF455A64),
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
                      fillColor: Color(0xFF455A64),
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
                            MaterialStateProperty.all<Color>(Color(0xFF455A64)),
                        backgroundColor:
                            MaterialStatePropertyAll(Color(0xFFfed36a)),
                      ),
                      onPressed: null,
                      child: Text(
                        'Login',
                        style: TextStyle(color: Color(0xFF000000)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    'Dont have an account? Sign Up Here',
                    style: TextStyle(color: Color(0xFFFFFFFF)),
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
