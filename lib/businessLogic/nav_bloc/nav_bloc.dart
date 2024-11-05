import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_event.dart';
part 'nav_state.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavState()) {
    on<UpdatePageIndex>((event, emit) {
      emit(state.copyWith(currentIndex: event.newIndex));
    });
  }
}
