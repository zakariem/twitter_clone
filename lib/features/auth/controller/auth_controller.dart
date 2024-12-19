import 'package:appwrite/models.dart';
import 'package:appwrite_toturial/api/api.dart';
import 'package:appwrite_toturial/core/core.dart';
import 'package:appwrite_toturial/features/auth/view/login_view.dart';
import 'package:appwrite_toturial/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) {
    return AuthController(
      api: ref.watch(authApiProvider),
    );
  },
);

final currentUserProvider = FutureProvider((ref) {
  final user = ref.watch(authControllerProvider.notifier).currentUser();
  return user;
});

class AuthController extends StateNotifier<bool> {
  final AuthApi _api;
  AuthController({required AuthApi api})
      : _api = api,
        super(false);

  Future<User?> currentUser() => _api.currentUser();

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _api.signup(email: email, password: password);
    state = false;
    res.fold(
      (l) => showSnackBar(context: context, message: l.message),
      (r) {
        showSnackBar(context: context, message: 'Account created Please login');
        Navigator.push(context, LoginView.route());
      },
    );
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _api.login(email: email, password: password);
    state = false;
    res.fold(
      (l) => showSnackBar(context: context, message: l.message),
      (r) {
        Navigator.pushAndRemoveUntil(
          context,
          HomeView.route(),
          (route) => false,
        );
      },
    );
  }
}
