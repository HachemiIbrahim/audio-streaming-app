import 'package:flutter/material.dart';
import 'package:music_app/core/theme/pallete.dart';
import 'package:music_app/features/auth/repository/auth_remote_repository.dart';
import 'package:music_app/features/auth/view/widgets/elevated_button.dart';
import 'package:music_app/core/widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final querry = MediaQuery.of(context).size;
    final AuthRemoteRepository authRemoteRepository = AuthRemoteRepository();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: querry.width * 0.03),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up.",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: querry.height * 0.06),
              CustomTextField(
                hint: 'name',
                controller: nameController,
              ),
              SizedBox(height: querry.height * 0.012),
              CustomTextField(
                hint: 'Email',
                controller: emailController,
              ),
              SizedBox(height: querry.height * 0.012),
              CustomTextField(
                hint: 'Password',
                controller: passwordController,
                isObscureText: true,
              ),
              SizedBox(height: querry.height * 0.012),
              CustomElevatedButton(
                name: "Sign up",
                onTap: () async {
                  await authRemoteRepository.signUp(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              SizedBox(height: querry.height * 0.012),
              RichText(
                text: TextSpan(
                  text: "Already have an acount ? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: Pallete.gradient2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
