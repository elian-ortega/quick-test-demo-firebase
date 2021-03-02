import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class User extends Equatable {
  User({
    @required this.id,
    @required this.email,
  });
  final String id;
  final String email;

  @override
  List<Object> get props => [id, email];
}
