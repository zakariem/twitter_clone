import 'package:appwrite_toturial/api/api.dart';
import 'package:appwrite_toturial/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) {
    return AuthController(
      api: ref.watch(authApiProvider),
    );
  },
);

class AuthController extends StateNotifier<bool> {
  final AuthApi _api;
  AuthController({required AuthApi api})
      : _api = api,
        super(false);

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _api.signup(email: email, password: password);
    res.fold(
      (l) => showSnackBar(context: context, message: l.message),
      (r) => debugPrint(r.email),
    );
  }
}
