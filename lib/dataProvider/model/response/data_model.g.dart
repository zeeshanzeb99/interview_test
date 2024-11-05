// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      upcomingMovies: (json['upcoming_movies'] as List<dynamic>?)
          ?.map((e) => UpcomingMovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => MovieCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      movieDetails: json['movie_details'] == null
          ? null
          : MovieDetailsModel.fromJson(
              json['movie_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'upcoming_movies':
          instance.upcomingMovies?.map((e) => e.toJson()).toList(),
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
      'movie_details': instance.movieDetails?.toJson(),
    };
