import 'package:json_annotation/json_annotation.dart';

import 'response_model.dart';

part 'main_response_model.g.dart';

@JsonSerializable()
class MainResponseModel {
  MainResponseModel({
    required this.response,
  });

  @JsonKey(name: 'response')
  ResponseModel response;

  factory MainResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MainResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainResponseModelToJson(this);
}
