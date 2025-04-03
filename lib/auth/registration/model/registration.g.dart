// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationData _$RegistrationDataFromJson(Map<String, dynamic> json) =>
    RegistrationData(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegistrationDataToJson(RegistrationData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
