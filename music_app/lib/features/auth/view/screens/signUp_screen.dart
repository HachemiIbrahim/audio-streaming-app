import 'package:flutter/material.dart';
import 'package:music_app/features/auth/view/widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final querry = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "SignUp.",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: querry.height * 0.06),
          const CostumTextField(hint: 'name'),
          SizedBox(height: querry.height * 0.012),
          const CostumTextField(hint: 'Email'),
          SizedBox(height: querry.height * 0.012),
          const CostumTextField(hint: 'Password'),
        ],
      ),
    );
  }
}
