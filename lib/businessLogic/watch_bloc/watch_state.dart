part of 'watch_bloc.dart';

@immutable
class WatchState extends Equatable {

  final ApiRequestStatus upcomingMoviesARS, movieCategoriesARS, movieDetailsARS;
  final List<MovieCategoryModel> movieCategories;
  final String searchQuery;
  final bool isSearchOpened;
  final List<Movie> upcomingMovies;
  final List<Movie> filteredMovies;
  final MovieDetails? movieDetails;
  final int? selectedIndex;
  final int? selectedSeat;

  WatchState({
    this.upcomingMoviesARS = const InitialApiRequestStatus(),
    this.movieCategoriesARS = const InitialApiRequestStatus(),
    this.movieDetailsARS = const InitialApiRequestStatus(),
    this.upcomingMovies = const [],
    this.filteredMovies = const [],
    this.movieCategories =  const [],
    this.movieDetails,
    this.searchQuery = '',
    this.isSearchOpened = false,
    this.selectedIndex = 0,
    this.selectedSeat = 0

  });
  @override
  List<Object?> get props => [
    upcomingMoviesARS,
    movieCategoriesARS,
    movieDetailsARS,
    upcomingMovies,
    filteredMovies,
    movieCategories,
    movieDetails,
    searchQuery,
    isSearchOpened,
    selectedIndex,
    selectedSeat,
  ];

  WatchState copyWith ({
    ApiRequestStatus? upcomingMoviesARS, movieCategoriesARS, movieDetailsARS,
    List<Movie>? upcomingMovies,filteredMovies,
    List<MovieCategoryModel>? movieCategories,
    MovieDetails? movieDetails,
    String? searchQuery,
    bool? isSearchOpened,
    int? selectedIndex,
    int? selectedSeat


  }) {
    return WatchState(
        upcomingMoviesARS : upcomingMoviesARS ?? this.upcomingMoviesARS,
        movieCategoriesARS: movieCategoriesARS ?? this.movieCategoriesARS,
        movieDetailsARS: movieDetailsARS ?? this.movieDetailsARS,
        upcomingMovies: upcomingMovies ?? this.upcomingMovies,
        filteredMovies: filteredMovies ?? this.filteredMovies,
      movieCategories: movieCategories ?? this.movieCategories,
        movieDetails: movieDetails ?? this.movieDetails,
        searchQuery: searchQuery ?? this.searchQuery,
        isSearchOpened: isSearchOpened ?? this.isSearchOpened,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        selectedSeat: selectedSeat ?? this.selectedSeat


    );
}



}


