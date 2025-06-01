// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionTokenImpl _$$SessionTokenImplFromJson(Map<String, dynamic> json) =>
    _$SessionTokenImpl(
      id: (json['id'] as num?)?.toInt(),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$SessionTokenImplToJson(_$SessionTokenImpl instance) =>
    <String, dynamic>{'id': instance.id, 'token': instance.token};
