import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'movie_category_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieCategoryModel {
  MovieCategoryModel({
    required this.categoryId,
    required this.categoryBannerImage,
    required this.categoryTitle,
  });

  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'category_banner_image')
  String? categoryBannerImage;
  @JsonKey(name: 'category_title')
  String? categoryTitle;



  factory MovieCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCategoryModelToJson(this);
}