import 'package:flutter/material.dart';
import 'package:project_uts/utils/colors.dart';

class buildTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final TextInputType textInputType;
  final bool isPasswordTextField;
  final String labelText;
  final String placeholder;

  const buildTextField({
    Key? key,
    required this.labelText,
    required this.placeholder,
    required this.textEditingController,
    this.isPass = false,
    required this.textInputType,
    required this.isPasswordTextField,
  }) : super(key: key);

  @override
  State<buildTextField> createState() => _buildTextFieldState();
}

class _buildTextFieldState extends State<buildTextField> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: widget.textEditingController,
        obscureText: widget.isPasswordTextField ? showPass : false,
        decoration: InputDecoration(
            suffixIcon: widget.isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: widget.labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: lightGreyUI,
            )),
      ),
    );
  }
}
