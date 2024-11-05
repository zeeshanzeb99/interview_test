part of 'nav_bloc.dart';

abstract class NavEvent {}

class UpdatePageIndex extends NavEvent{
  final int newIndex;
  UpdatePageIndex({required this.newIndex});
}
