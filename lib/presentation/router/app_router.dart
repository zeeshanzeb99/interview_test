

import 'package:adv_test/businessLogic/watch_bloc/watch_bloc.dart';
import 'package:adv_test/dataProvider/model/response/movie_details.dart';
import 'package:adv_test/helper/resources/constant_resources.dart';
import 'package:adv_test/presentation/router/routes.dart';
import 'package:adv_test/presentation/screens/mainScreen/main_screen.dart';
import 'package:adv_test/presentation/screens/underDevScreen/under_dev_screen.dart';
import 'package:adv_test/presentation/screens/watchScreen/movie_details_screen.dart';
import 'package:adv_test/presentation/screens/watchScreen/select_seat_screen.dart';
import 'package:adv_test/presentation/screens/watchScreen/watch_trailer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/cupertino.dart';

import '../../businessLogic/nav_bloc/nav_bloc.dart';
import '../../dataProvider/network/interceptor.dart';
import '../../dataProvider/network/mock_api_client.dart';
import '../../dataProvider/network/network_api_client.dart';
import '../../repository/data_manager.dart';
import '../screens/watchScreen/payment_screen.dart';

class AppRouter {
  AppRouter() {
    Dio dio = Dio(
      (BaseOptions(
          contentType: ConstantResources.CONTENT_TYPE,
          headers: {
            "Accept": ConstantResources.CONTENT_TYPE,
            "api-key":'0d59bd03bcea976b4cca943b280b7e87',
          },
          baseUrl:  "https://api.themoviedb.org/3/movie/")),
    );
    dio.interceptors
        .add(PrettyDioLogger(requestBody: true, requestHeader: true));
    dio.interceptors.add(TokenInterceptor());
    dataManager = DataManager(
        mockApiClient: MockApiClient(),
        networkApiClient: NetworkApiClient(dio));
  }

  late DataManager dataManager;

  Route? generateRoute(RouteSettings routeSettings) {
    String route = routeSettings.name ?? "";
    switch (route) {
      case MAIN_SCREEN_ROUTE:
        {
          final index = routeSettings.arguments as int? ?? 1;
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => NavBloc(),
                ),
                BlocProvider(
                  create: (context) => WatchBloc(dataManager: dataManager),
                ),

              ],
              child: MainScreen(initialIndex: index),
            ),
          );
        }
      case UNDER_DEV_SCREEN:
        return MaterialPageRoute(
            builder: (_) => const UnderDevScreen());

      case WATCH_TRAILER_SCREEN:
        return MaterialPageRoute(
            builder: (_) =>  const WatchTrailer());

      case SELECT_SEAT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => WatchBloc(dataManager: dataManager),
              ),
            ],
            child: SelectSeatScreen(movieDetails: routeSettings.arguments as MovieDetails)
          )
        );

      case SELECT_PAYMENT_SCREEN:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => WatchBloc(dataManager: dataManager),
                  ),
                ],
                child: PaymentScreen(movieDetails: routeSettings.arguments as MovieDetails)
            )
        );

        case MOVIE_DETAILS_SCREEN:
        {
          final movieId = routeSettings.arguments as int? ?? 0;
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => WatchBloc(dataManager: dataManager),
                ),
              ],
              child: MovieDetailsScreen(movieId: movieId),
            ),
          );
        }

      default:
        return null;
    }
  }

  void dispose() {}
}