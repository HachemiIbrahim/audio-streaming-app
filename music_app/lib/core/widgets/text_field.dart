import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final bool isObscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.isObscureText = false,
    this.readOnly = false,
    this.onTap,
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
