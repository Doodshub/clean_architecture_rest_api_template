import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({int? id, String? name, bool? isAuthenticated}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User._();
}
