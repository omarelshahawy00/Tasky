
import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  final String? phone;
  final String? password;
  final String? displayName;
  final int? experienceYears;
  final String? address;
  final String? level;

  SignupRequestModel({
    required this.phone,
    required this.password,
    required this.displayName,
    required this.experienceYears,
    required this.address,
    required this.level,
  });

    Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);     
}
