import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'upcoming_movie_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UpcomingMovieModel {
  UpcomingMovieModel({
    required this.movieId,
    required this.movieBannerImage,
    required this.movieTitle,
});

  @JsonKey(name: 'movie_id')
  int? movieId;
  @JsonKey(name: 'movie_banner_image')
  String? movieBannerImage;
  @JsonKey(name: 'movie_title')
  String? movieTitle;



  factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingMovieModelToJson(this);
}