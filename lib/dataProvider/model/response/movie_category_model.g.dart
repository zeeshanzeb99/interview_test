// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCategoryModel _$MovieCategoryModelFromJson(Map<String, dynamic> json) =>
    MovieCategoryModel(
      categoryId: (json['category_id'] as num?)?.toInt(),
      categoryBannerImage: json['category_banner_image'] as String?,
      categoryTitle: json['category_title'] as String?,
    );

Map<String, dynamic> _$MovieCategoryModelToJson(MovieCategoryModel instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category_banner_image': instance.categoryBannerImage,
      'category_title': instance.categoryTitle,
    };
