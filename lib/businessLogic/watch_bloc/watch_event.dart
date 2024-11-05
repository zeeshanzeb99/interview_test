part of 'watch_bloc.dart';

abstract class WatchEvent {}

class FetchUpcomingMoviesEvent extends WatchEvent {}

class FetchMovieCategoriesEvent extends WatchEvent {}

class FetchMovieDetailsEvent extends WatchEvent {
  final int movieId;

  FetchMovieDetailsEvent({required this.movieId});
}

class SetSearch extends WatchEvent {}
class CloseSearch extends WatchEvent {}

class SelectDate extends WatchEvent {
  final int selectIndex;
  SelectDate({required this.selectIndex});

}

class SelectSeat extends WatchEvent {
  final int selectSeat;
  SelectSeat({required this.selectSeat});

}


class UpdateSearchQuery extends WatchEvent{
 final String searchQuery;
 UpdateSearchQuery({required this.searchQuery});
}

