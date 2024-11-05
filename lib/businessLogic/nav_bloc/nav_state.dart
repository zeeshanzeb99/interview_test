part of 'nav_bloc.dart';

class NavState extends Equatable {
  final int currentIndex;

  const NavState({
    this.currentIndex = 1,
});
  @override
  List<Object> get props => [currentIndex];

  NavState copyWith ({
    int? currentIndex,

}) {
    return NavState(
        currentIndex : currentIndex ?? this.currentIndex,
    );
}

}


