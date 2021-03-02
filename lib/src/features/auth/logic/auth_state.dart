import 'package:flutter_test_shop_firebase/src/features/auth/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  /// Initial/default state
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  /// Data is loading state
  const factory AuthState.authenticated({@required User user}) = _Authenticated;

  /// Error when loading data state
  const factory AuthState.unauthenticated() = _Unauthenticated;
}
