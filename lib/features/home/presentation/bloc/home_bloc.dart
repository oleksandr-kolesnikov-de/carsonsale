/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/features/home/domain/usecases/search_car.dart';
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

  HomeBloc(this.searchCar) : super(HomeInitial("")) {
    on<HomeSearchCarsEvent>((event, emit) async {
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
