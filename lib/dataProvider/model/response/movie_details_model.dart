import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'movie_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetailsModel {
  MovieDetailsModel({
    required this.movieId,
    required this.movieBannerImage,
    required this.movieTitle,
    required this.genres,
    required this.movieOverview,
    required this.movieTrailerLink,
    required this.releaseDate
  });

  @JsonKey(name: 'movie_id')
  int? movieId;
  @JsonKey(name: 'movie_banner_image')
  String? movieBannerImage;
  @JsonKey(name: 'movie_title')
  String? movieTitle;
  @JsonKey(name: 'movie_release_date')
  int? releaseDate;
  @JsonKey(name: 'movie_trailer_link')
  String? movieTrailerLink;
  @JsonKey(name: 'movie_genres')
  List <String>? genres;
  @JsonKey(name: 'movie_overview')
  String? movieOverview;





  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}