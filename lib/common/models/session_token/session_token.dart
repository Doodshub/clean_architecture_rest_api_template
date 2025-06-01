import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_token.freezed.dart';
part 'session_token.g.dart';

@freezed
class SessionToken with _$SessionToken {
  const factory SessionToken({int? id, String? token}) = _SessionToken;

  factory SessionToken.fromJson(Map<String, dynamic> json) =>
      _$SessionTokenFromJson(json);

  const SessionToken._();
}
