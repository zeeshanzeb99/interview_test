import 'dart:core';

import 'package:adv_test/dataProvider/model/response/movie_category_model.dart';
import 'package:adv_test/dataProvider/model/response/movie_details_model.dart';
import 'package:adv_test/dataProvider/model/response/upcoming_movie_model.dart';
import 'package:json_annotation/json_annotation.dart';



part 'data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DataModel {
  DataModel({
    this.upcomingMovies,
    this.categories,
    this.movieDetails,
});

  @JsonKey(name: 'upcoming_movies')
  List<UpcomingMovieModel>? upcomingMovies;
  @JsonKey(name: 'categories')
  List<MovieCategoryModel>? categories;
  @JsonKey(name: 'movie_details')
  MovieDetailsModel? movieDetails;



  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
