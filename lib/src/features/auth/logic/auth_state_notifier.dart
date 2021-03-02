part of 'auth_provider.dart';

/// Defines all the Auth logic the app will use
class AuthNotifier extends StateNotifier<AuthState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  AuthNotifier({
    @required IAuthRepository firebaseAuthRepository,
  })  : assert(firebaseAuthRepository != null),
        _firebaseAuthRepository = firebaseAuthRepository,
        super(AuthState.initial());

  final IAuthRepository _firebaseAuthRepository;

  Future<void> singIn({
    @required String email,
    @required String password,
  }) async {
    state = AuthState.loading();

    final loginResult =
        await _firebaseAuthRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    loginResult.fold(
      (l) => state = AuthState.unauthenticated(),
      (r) => state = AuthState.authenticated(user: r),
    );
  }

  Future<void> signOut() async {
    _firebaseAuthRepository.signOut();
    state = AuthState.unauthenticated();
  }
}
