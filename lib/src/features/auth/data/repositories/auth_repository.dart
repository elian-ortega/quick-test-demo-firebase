import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_test_shop_firebase/src/features/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

import '../../domain/domain.dart';

import 'package:flutter_test_shop_firebase/src/features/auth/domain/entities/user.dart';

/// Auth repository implementation
class FirebaseAuthRepository implements IAuthRepository {
  /// Auth repository constructor
  FirebaseAuthRepository({
    @required FirebaseAuth firebaseAuth,
  })  : assert(firebaseAuth != null),
        _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<User> getSignedInUser() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> registerWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(
        UserModel(
          id: userCredential.user.uid,
          email: userCredential.user.email,
        ),
      );
    } on FirebaseAuthException catch (_) {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(
        UserModel(
          id: userCredential.user.uid,
          email: userCredential.user.email,
        ),
      );
    } on FirebaseAuthException catch (_) {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  void signOut() {
    _firebaseAuth.signOut();
  }
}
