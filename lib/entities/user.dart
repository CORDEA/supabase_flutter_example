import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@Freezed(copyWith: false)
class User with _$User {
  const factory User({
    required String id,
    required String name,
  }) = _User;

  static User fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
    );
  }
}
