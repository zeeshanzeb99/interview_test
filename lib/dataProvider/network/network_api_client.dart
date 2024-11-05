import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/movie_details.dart';
import '../model/response/upcoming_movies.dart';

part 'network_api_client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/movie/")
abstract class NetworkApiClient {
  factory NetworkApiClient(Dio dio, {String baseUrl}) = _NetworkApiClient;

  @GET("upcoming")
  Future<UpcomingMoviesResponse> getUpcomingMovies(
      @Query('api_key') String apiKey);

  @GET("{movieId}")
  Future<MovieDetails> getMovieDetails(
      @Path("movieId") int movieId,
      @Query('api_key') String apiKey);
}

