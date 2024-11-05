// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      movieId: (json['movie_id'] as num?)?.toInt(),
      movieBannerImage: json['movie_banner_image'] as String?,
      movieTitle: json['movie_title'] as String?,
      genres: (json['movie_genres'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      movieOverview: json['movie_overview'] as String?,
      movieTrailerLink: json['movie_trailer_link'] as String?,
      releaseDate: (json['movie_release_date'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'movie_id': instance.movieId,
      'movie_banner_image': instance.movieBannerImage,
      'movie_title': instance.movieTitle,
      'movie_release_date': instance.releaseDate,
      'movie_trailer_link': instance.movieTrailerLink,
      'movie_genres': instance.genres,
      'movie_overview': instance.movieOverview,
    };
