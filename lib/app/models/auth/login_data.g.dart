// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginData _$LoginDataFromJson(Map<String, dynamic> json) => _LoginData(
  token: json['token'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$LoginDataToJson(_LoginData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };
