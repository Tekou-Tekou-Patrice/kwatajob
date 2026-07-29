import 'dart:async';

abstract class AuthRepository {
  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String userType,
  });

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();

  Future<String?> getCurrentUserId();
}

class FirebaseAuthRepository implements AuthRepository {
  @override
  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
    required String userType,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    throw UnimplementedError('Firebase integration to be configured.');
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 800));
    throw UnimplementedError('Firebase integration to be configured.');
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 300));
    throw UnimplementedError('Firebase integration to be configured.');
  }

  @override
  Future<String?> getCurrentUserId() async {
    return null;
  }
}
