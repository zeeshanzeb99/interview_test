// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingMovieModel _$UpcomingMovieModelFromJson(Map<String, dynamic> json) =>
    UpcomingMovieModel(
      movieId: (json['movie_id'] as num?)?.toInt(),
      movieBannerImage: json['movie_banner_image'] as String?,
      movieTitle: json['movie_title'] as String?,
    );

Map<String, dynamic> _$UpcomingMovieModelToJson(UpcomingMovieModel instance) =>
    <String, dynamic>{
      'movie_id': instance.movieId,
      'movie_banner_image': instance.movieBannerImage,
      'movie_title': instance.movieTitle,
    };
