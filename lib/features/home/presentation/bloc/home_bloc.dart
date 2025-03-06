/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/core/use_case/no_params.dart';
import 'package:carsonsale/features/home/domain/usecases/search_car.dart';
import 'package:carsonsale/features/login/domain/usecases/load_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/car_info.dart';
import '../../domain/entities/car_search_result.dart';
import '../../domain/entities/car_short_info.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SearchCar searchCar;
  final LoadUser loadUser;
  HomeBloc(this.searchCar, this.loadUser) : super(HomeInitial("")) {
    on<HomeInitializeEvent>((event, emit) async {
      final result = await loadUser(NoParams());
      result.fold((failure) => {}, (userName) => emit(HomeInitial(userName)));
    });

    on<HomeSearchCarsEvent>((event, emit) async {
      if (event.query.isEmpty) {
        emit(HomeInitial(state.userName));
        return;
      }
      emit(HomeLoading(state.userName));
      final CarSearchResult result = await searchCar(
        SearchCarParams(searchQuery: event.query),
      );
      switch (result) {
        case CarFailureResult():
          emit(HomeError(state.userName, failure: result.failure));
        case CarInfoResult():
          emit(HomeLoaded(state.userName, carInfo: result.carInfo));
        case CarListResult():
          emit(
            HomeLoadedList(state.userName, carShortInfoList: result.carList),
          );
      }
    });
  }
}
