import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
  final String hint;
  const CostumTextField({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
