import 'package:appwrite_toturial/features/auth/controller/auth_controller.dart';
import 'package:appwrite_toturial/features/auth/widgets/auth_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_view.dart';

import '../../../common/common.dart';
import '../../../constants/constants.dart';
import '../../../theme/theme.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );

  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
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

  void onSignUp() {
    if (_formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).signUp(
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
                        AuthField(
                          controller: emailController,
                          hintText: 'Email',
                          validator: ValidationUtils.validateEmail,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 25),
                        AuthField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: _isPasswordObscure,
                          isPassword: true,
                          toggleVisibility: _togglePasswordVisibility,
                          validator: ValidationUtils.validatePassword,
                        ),
                        const SizedBox(height: 40),
                        Align(
                          alignment: Alignment.topRight,
                          child: RoundedSmallButton(
                            onTap: onSignUp,
                            label: 'Done',
                          ),
                        ),
                        const SizedBox(height: 40),
                        RichText(
                          text: TextSpan(
                            text: "Already have an account?",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Pallete.greyColor,
                            ),
                            children: [
                              TextSpan(
                                text: ' Login',
                                style: const TextStyle(
                                  color: Pallete.blueColor,
                                  fontSize: 16,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      LoginView.route(),
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
