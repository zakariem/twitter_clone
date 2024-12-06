import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:appwrite_toturial/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final authApiProvider =
    Provider((ref) => AuthApi(account: ref.watch(appwriteAccountProvider)));

abstract class IAuthApi {
  FutureEither<User> signup({
    required String email,
    required String password,
  });

  FutureEither<User> login({
    required String email,
    required String password,
  });
}

class AuthApi implements IAuthApi {
  final Account _account;

  AuthApi({required Account account}) : _account = account;

  @override
  FutureEither<User> signup({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(
        userId: 'unique()',
        email: email,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(message: e.message.toString(), stackTrace: stackTrace),
      );
    }
  }

  @override
  FutureEither<User> login({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
