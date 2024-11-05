// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainResponseModel _$MainResponseModelFromJson(Map<String, dynamic> json) =>
    MainResponseModel(
      response:
          ResponseModel.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainResponseModelToJson(MainResponseModel instance) =>
    <String, dynamic>{
      'response': instance.response,
    };
