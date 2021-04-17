import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class User extends Equatable {
  const User({
    required this.email,
    required this.username,
    required this.token,
    this.bio,
    this.image,
  });

  final String token;
  final String username;
  final String email;
  final String? bio;
  final String? image;

  @override
  List<Object?> get props => [email, username, token];
}
