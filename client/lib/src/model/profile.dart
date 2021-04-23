import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Profile extends Equatable {
  const Profile({
    required this.username,
    required this.following,
    this.bio,
    this.image,
  });

  final String username;
  final String? bio;
  final String? image;
  final bool following;

  @override
  List<Object?> get props => [username, following];
}
