// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      json['message'] as String?,
      (json['statusCode'] as num?)?.toInt(),
      id: json['_id'] as String?,
      displayName: json['displayName'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$SignupResponseModelToJson(
  SignupResponseModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'displayName': instance.displayName,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'message': instance.message,
  'statusCode': instance.statusCode,
};
