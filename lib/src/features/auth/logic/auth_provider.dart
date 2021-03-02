import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_shop_firebase/src/features/auth/data/data.dart';
import 'package:flutter_test_shop_firebase/src/features/auth/domain/repositories/iauth_repository.dart';

import 'auth_state.dart';

part 'auth_state_notifier.dart';

/// Provider to use the AuthStateNotifier
final authNotifierProvider = StateNotifierProvider(
  (ref) => AuthNotifier(
    firebaseAuthRepository: ref.watch(firebaseAuthRepository),
  ),
);

/// Repositories Providers
final firebaseAuthRepository = Provider<IAuthRepository>((ref) {
  return FirebaseAuthRepository(
    firebaseAuth: FirebaseAuth.instance,
  );
});
