import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:errors/errors.dart';

import '../entities/user.dart';

/// Repository interface for auth
abstract class IAuthRepository {
  Future<User> getSignedInUser();

  Future<Either<Failure, User>> registerWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  Future<Either<Failure, User>> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  void signOut();
}
