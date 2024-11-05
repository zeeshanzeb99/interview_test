



import 'package:adv_test/dataProvider/model/response/main_response_model.dart';
import 'package:adv_test/dataProvider/model/response/upcoming_movies.dart';

import '../dataProvider/model/response/movie_details.dart';

abstract class DataManagerImp {

  Future<UpcomingMoviesResponse> fetchUpcomingMovies(String apiKey);
  Future<MovieDetails> fetchMovieDetails(int movieId, String apiKey);


}