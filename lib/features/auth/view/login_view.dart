import 'package:appwrite_toturial/features/auth/widgets/auth_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/common.dart';
import '../../../constants/constants.dart';
import '../../../theme/theme.dart';
import '../controller/auth_controller.dart';
import 'signup_view.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appBar = UiContants.appBar();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isPasswordObscure = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    if (_formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).login(
            email: emailController.text,
            password: passwordController.text,
            context: context,
          );
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscure = !_isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? const Loader()
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Email field
                        AuthField(
                          controller: emailController,
                          hintText: 'Email',
                          validator: ValidationUtils.validateEmail,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 25),
                        // Password field
                        AuthField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: _isPasswordObscure,
                          isPassword: true,
                          toggleVisibility: _togglePasswordVisibility,
                          validator: ValidationUtils.validatePassword,
                        ),
                        const SizedBox(height: 40),
                        // Login button
                        Align(
                          alignment: Alignment.topRight,
                          child: RoundedSmallButton(
                            onTap: onLogin,
                            label: 'Done',
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Navigate to Sign Up
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
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      SignUpView.route(),
                                      (route) => false,
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
