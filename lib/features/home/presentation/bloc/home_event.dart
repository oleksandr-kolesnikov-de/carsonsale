/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeSearchCarsEvent extends HomeEvent {
  final String query;

  const HomeSearchCarsEvent(this.query);

  @override
  List<Object> get props => [query];
}