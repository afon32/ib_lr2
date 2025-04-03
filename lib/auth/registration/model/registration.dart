import 'package:json_annotation/json_annotation.dart';

part 'registration.g.dart';

@JsonSerializable()
class RegistrationData {
  final String name;
  final String email;
  final String password;

  RegistrationData({
    required this.name,
    required this.email,
    required this.password,
  });

  factory RegistrationData.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDataFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationDataToJson(this);
}
