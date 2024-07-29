import 'package:flutter/material.dart';
import 'package:music_app/core/theme/pallete.dart';
import 'package:music_app/core/utils.dart';
import 'package:music_app/core/widgets/loader.dart';
import 'package:music_app/features/auth/view/screens/login_screen.dart';
import 'package:music_app/features/auth/view/widgets/elevated_button.dart';
import 'package:music_app/core/widgets/text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:music_app/features/home/view/screens/home_screen.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
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
    final isLoading = ref
        .watch(authViewModelProvider.select((val) => val?.isLoading == true));

    ref.listen(
      authViewModelProvider,
      (_, next) {
        next?.when(
          data: (data) {
            showSnackBar(
              context,
              'Account created successfully!',
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          },
          error: (error, st) {
            showSnackBar(context, error.toString());
          },
          loading: () {},
        );
      },
    );
    return Scaffold(
      body: isLoading
          ? const Loader()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: querry.width * 0.03),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign Up.",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
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
                        if (formKey.currentState!.validate()) {
                          await ref.read(authViewModelProvider.notifier).signUp(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              );
                        }
                      },
                    ),
                    SizedBox(height: querry.height * 0.012),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                      child: RichText(
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
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
