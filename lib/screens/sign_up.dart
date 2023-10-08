import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_uts/utils/colors.dart';
import 'package:project_uts/utils/utils.dart';
import 'package:project_uts/widgets/text_field.dart';
import 'package:project_uts/resources/auth_methods.dart';
import 'log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: '',
    );

    print(res);
    if (res == 'Success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LogIn(),
        ),
      );
    } else {
      showSnackBar(res, context);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              //logo
              SvgPicture.asset(
                'assets/logo/default-logo-color.svg',
                height: 180,
              ),

              //spacing
              const SizedBox(
                height: 32,
              ),

              //textfield username
              TextFields(
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),

              //spacing
              const SizedBox(
                height: 8,
              ),

              //textfield email
              TextFields(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),

              //spacing
              const SizedBox(
                height: 8,
              ),

              //textfield password
              TextFields(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),

              //spacing
              const SizedBox(
                height: 18,
              ),

              //sign up  button
              InkWell(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: darkGreyUI,
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: lightGreyUI,
                          ),
                        )
                      : const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: purpleUI,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),

              //spacing
              const SizedBox(
                height: 12,
              ),

              Flexible(flex: 2, child: Container()),
              //To sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: const Text(
                      "Have an account? ",
                      style: TextStyle(
                        color: aquaUI,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: const Text(
                        "Log in.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: purpleUI),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
