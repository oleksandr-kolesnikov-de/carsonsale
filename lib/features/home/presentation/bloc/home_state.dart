/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final CarInfo carInfo;

  const HomeLoaded({required this.carInfo});

  @override
  List<Object> get props => [carInfo];
}

class HomeLoadedList extends HomeState {
  final List<CarShortInfo> carShortInfoList;

  const HomeLoadedList({required this.carShortInfoList});

  @override
  List<Object> get props => [carShortInfoList];
}

class HomeError extends HomeState {
  final Failure failure;

  const HomeError({required this.failure});

  @override
  List<Object> get props => [failure];
}
