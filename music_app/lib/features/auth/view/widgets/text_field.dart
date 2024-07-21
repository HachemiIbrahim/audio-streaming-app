import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isObscureText;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return '$hint is empty';
        }
        return null;
      },
      controller: controller,
      obscureText: isObscureText,
    );
  }
}
