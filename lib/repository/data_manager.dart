
import 'package:dio/dio.dart';

import '../dataProvider/model/response/main_response_model.dart';
import '../dataProvider/model/response/movie_details.dart';
import '../dataProvider/model/response/response_model.dart';
import '../dataProvider/model/response/upcoming_movies.dart';
import '../dataProvider/network/mock_api_client.dart';
import '../dataProvider/network/network_api_client.dart';
import '../helper/resources/string_resources.dart';
import '../helper/util/hive_utils.dart';
import '../helper/util/utils.dart';
import 'data_manager_imp.dart';

class DataManager implements DataManagerImp {
  late final MockApiClient _mockApiClient;
  late final NetworkApiClient _networkApiClient;

  DataManager(
      {required MockApiClient mockApiClient,
      required NetworkApiClient networkApiClient}) {
    _mockApiClient = mockApiClient;
    _networkApiClient = networkApiClient;
  }

  final jwt = HiveBox().getValue(key: 'jwt');
  final userId = HiveBox().getValue(key: 'userId');



  @override
  Future<UpcomingMoviesResponse> fetchUpcomingMovies(String apiKey) {
    return _networkApiClient.getUpcomingMovies(apiKey)
        .then((successResponse) => successResponse)
        .catchError((e) {
      switch (e.runtimeType) {
        case DioError:
          return errorHandling(e);
        default:
          Utils.console("Exception: $e");
      }
    });
  }

  @override
  Future<MovieDetails> fetchMovieDetails(int movieId, String apiKey) {
    return _networkApiClient.getMovieDetails(movieId, apiKey)
        .then((successResponse) => successResponse)
        .catchError((e) {
      switch (e.runtimeType) {
        case DioError:
          return errorHandling(e);
        default:
          Utils.console("Exception: $e");
      }
    });
  }

  @override
  Future<MainResponseModel> fetchMovieCategories() {
    return _mockApiClient.mockApiCall('movie_categories')
        .then((successResponse) => successResponse)
        .catchError((e) {
      switch (e.runtimeType) {
        case DioError:
          return errorHandling(e);
        default:
          Utils.console("Exception: $e");
      }
    });
  }









  MainResponseModel errorHandling(DioError e) {
    final errorResponse = e.response;
    if (errorResponse?.data != null) {
      var jsonResponse = MainResponseModel.fromJson(errorResponse?.data);
      return MainResponseModel(
          response: ResponseModel(
              message: jsonResponse.response.message,
              status: jsonResponse.response.status,
              errorCode: errorResponse?.statusCode));
    } else {
      return MainResponseModel(
          response: ResponseModel(
              message: StringResources.STR_STH_WRONG,
              status: false,
              errorCode: errorResponse?.statusCode));
    }
  }
}
