import 'package:json_annotation/json_annotation.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? displayName;
  final String? accessToken;
  final String? refreshToken;
  final String? message;
  final int? statusCode;

  SignupResponseModel(
    this.message,
    this.statusCode, {
    required this.id,
    required this.displayName,
    required this.accessToken,
    required this.refreshToken,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);
}
