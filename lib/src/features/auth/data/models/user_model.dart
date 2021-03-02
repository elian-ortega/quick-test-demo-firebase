import 'package:meta/meta.dart';
import 'package:flutter_test_shop_firebase/src/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    @required String id,
    @required String email,
  }) : super(email: email, id: id);
}
