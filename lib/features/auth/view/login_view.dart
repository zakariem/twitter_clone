import 'package:appwrite_toturial/features/auth/widgets/auth_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/rounded_small_button.dart';
import '../../../constants/constants.dart';
import '../../../theme/theme.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final appBar = UiContants.appBar();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // email
                AuthField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                const SizedBox(height: 25),
                // password
                AuthField(
                  controller: passwordController,
                  hintText: 'Password',
                ),
                const SizedBox(height: 40),
                // login button
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                    onTap: () {},
                    label: 'Done',
                  ),
                ),
                // or signup
                const SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account?",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Pallete.greyColor,
                    ),
                    children: [
                      TextSpan(
                        text: ' Sign up',
                        style: const TextStyle(
                          color: Pallete.blueColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
