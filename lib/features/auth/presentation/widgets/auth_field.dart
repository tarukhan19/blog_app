import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool isObscureText;

  const AuthField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.isObscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(27),
      ),
      validator: (value) {
        if (value.toString().isEmpty) {
          return '$hintText is missing';
        } else {
          return null;
        }
      },
      obscureText: isObscureText,
    );
  }
}
