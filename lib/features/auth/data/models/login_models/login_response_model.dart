import 'package:json_annotation/json_annotation.dart';
 part 'login_response_model.g.dart';
@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'access_token')
  final String? accessToken;
    @JsonKey(name: 'refresh_token')
  final String? refreshToken;
@JsonKey(name: '_id')
  final String? userId;
  final String? message;
  final int? statusCode;

  LoginResponseModel({
    this.accessToken,
    this.refreshToken,
    this.userId,
    this.message,
    this.statusCode,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}
