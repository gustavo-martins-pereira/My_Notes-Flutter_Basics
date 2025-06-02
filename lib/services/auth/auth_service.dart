import 'package:notes/models/auth_user.dart';
import 'package:notes/models/providers/impl/firebase_auth_provider.dart';

import '../../models/providers/auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider authProvider;

  const AuthService(this.authProvider);

  factory AuthService.firebase() => AuthService(FirebaseAuthProviderImpl());

  @override
  Future<void> initialize() => authProvider.initialize();

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) => authProvider.createUser(email: email, password: password);

  @override
  AuthUser? get currentUser => authProvider.currentUser;

  @override
  Future<AuthUser> logIn({required String email, required String password}) =>
      authProvider.logIn(email: email, password: password);

  @override
  Future<void> logOut() => authProvider.logOut();

  @override
  Future<void> sendEmailVerification() => authProvider.sendEmailVerification();
}
