/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final String userName;
  const HomeState(this.userName);

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial(super.userName);
}

class HomeLoading extends HomeState {
  const HomeLoading(super.userName);
}

class HomeLoaded extends HomeState {
  final CarInfo carInfo;

  const HomeLoaded(super.userName, {required this.carInfo});

  @override
  List<Object> get props => [carInfo];
}

class HomeLoadedList extends HomeState {
  final List<CarShortInfo> carShortInfoList;

  const HomeLoadedList(super.userName, {required this.carShortInfoList});

  @override
  List<Object> get props => [carShortInfoList];
}

class HomeError extends HomeState {
  final Failure failure;

  const HomeError(super.userName, {required this.failure});

  @override
  List<Object> get props => [failure];
}
