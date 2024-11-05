import 'dart:async';

import 'package:adv_test/businessLogic/api_request_status.dart';
import 'package:adv_test/dataProvider/model/response/movie_category_model.dart';
import 'package:adv_test/dataProvider/model/response/movie_details.dart';
import 'package:adv_test/dataProvider/model/response/movie_details_model.dart';
import 'package:adv_test/dataProvider/model/response/upcoming_movie_model.dart';
import 'package:adv_test/repository/data_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../dataProvider/model/response/upcoming_movies.dart';
import '../../helper/resources/dimension_resources.dart';

part 'watch_event.dart';
part 'watch_state.dart';

class WatchBloc extends Bloc<WatchEvent, WatchState> {
  final DataManager dataManager;
  final String apiKey = '0d59bd03bcea976b4cca943b280b7e87';
  WatchBloc({required this.dataManager}) : super(WatchState()) {

    on<SetSearch>(_setSearch);
    on<CloseSearch>(_closeSearch);
    on<SelectDate>(_selectDate);
    on<SelectSeat>(_selectSeat);
    on<UpdateSearchQuery>(_updateSearch);
    on<FetchUpcomingMoviesEvent>(_fetchUpcomingMovies);
    on<FetchMovieCategoriesEvent>(_fetchMovieCategories);
    on<FetchMovieDetailsEvent>(_fetchMovieDetails);


    on<WatchEvent>((event, emit) {

    });
  }

  FutureOr<void> _updateSearch(UpdateSearchQuery event, Emitter<WatchState> emit) {
    print('UPDATING SEARCH: ${event.searchQuery}');
    final movies = state.upcomingMovies;
    final searchQuery = event.searchQuery.toLowerCase();
    final filteredMovies = movies.where((movie) {
      final movieName = movie.originalTitle?.toLowerCase();
      return movieName!.contains(searchQuery);
    }).toList();

    emit(state.copyWith(
      filteredMovies: filteredMovies,
      searchQuery: event.searchQuery
    ));
  }


  FutureOr<void> _setSearch(SetSearch event, Emitter<WatchState> emit) {
    emit(state.copyWith(
        isSearchOpened: true
    ));
  }

  FutureOr<void> _closeSearch(CloseSearch event, Emitter<WatchState> emit) {
    emit(state.copyWith(
        isSearchOpened: false,
      searchQuery: ''
    ));
  }

  FutureOr<void> _selectDate(SelectDate event, Emitter<WatchState> emit) {
    emit(state.copyWith(
        selectedIndex: event.selectIndex,
    ));
  }
  FutureOr<void> _selectSeat(SelectSeat event, Emitter<WatchState> emit) {
    emit(state.copyWith(
      selectedSeat: event.selectSeat,
    ));
  }


  Future<void> _fetchUpcomingMovies(
      FetchUpcomingMoviesEvent event, Emitter<WatchState> emit) async {
    emit(state.copyWith(upcomingMoviesARS: ApiRequestStatusLoading()));

    try {
      final response = await dataManager.fetchUpcomingMovies(apiKey);
      emit(state.copyWith(
        upcomingMoviesARS: ApiRequestStatusSuccess(),
        upcomingMovies: response.results ?? [],
      ));
    } catch (e) {
      emit(state.copyWith(
          upcomingMoviesARS: ApiRequestStatusFailure(null, e.toString())));
    }
  }


  FutureOr<void> _fetchMovieCategories(FetchMovieCategoriesEvent event, Emitter<WatchState> emit) async {
    emit(state.copyWith(
      movieCategoriesARS: ApiRequestStatusLoading(),
    ));

    try {
      final mainResponse =
      await dataManager.fetchMovieCategories();
      if (mainResponse.response.status) {

        final movieCategories = mainResponse.response.data?.categories;

        emit(state.copyWith(
          movieCategoriesARS: ApiRequestStatusSuccess(),
          movieCategories: movieCategories,

        ));
      } else {
        final failureARS = ApiRequestStatusFailure(
          mainResponse.response.errorCode,
          mainResponse.response.message,
        );
        emit(state.copyWith(movieCategoriesARS: failureARS));
        if (mainResponse.response.errorCode ==
            Dim.ERROR_CODE_401) {}
      }
    } catch (e) {
      final failureARS = ApiRequestStatusFailure(null, e.toString());
      emit(state.copyWith(movieCategoriesARS: failureARS));
    }
  }

  FutureOr<void> _fetchMovieDetails(
      FetchMovieDetailsEvent event, Emitter<WatchState> emit) async {
    emit(state.copyWith(movieDetailsARS: ApiRequestStatusLoading()));

    try {
      final movieDetails =
      await dataManager.fetchMovieDetails(event.movieId, "0d59bd03bcea976b4cca943b280b7e87");
      emit(state.copyWith(
          movieDetailsARS: ApiRequestStatusSuccess(),
          movieDetails: movieDetails));
    } catch (e) {
      emit(state.copyWith(
          movieDetailsARS: ApiRequestStatusFailure(null, e.toString())));
    }
  }


}
