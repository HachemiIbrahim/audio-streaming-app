import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_app/core/theme/pallete.dart';
import 'package:music_app/features/auth/repository/auth_remote_repository.dart';
import 'package:music_app/features/auth/view/screens/signUp_screen.dart';
import 'package:music_app/features/auth/view/widgets/elevated_button.dart';
import 'package:music_app/core/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthRemoteRepository authRemoteRepository = AuthRemoteRepository();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    final querry = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: querry.width * 0.03),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In.",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: querry.height * 0.06),
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
                name: "Sign in",
                onTap: () async {
                  print(emailController.text);
                  print(passwordController.text);
                  await authRemoteRepository.login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
              ),
              SizedBox(height: querry.height * 0.012),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupScreen(),
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an acount ? ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: const [
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Pallete.gradient2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
