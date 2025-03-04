/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/features/home/domain/usecases/search_car.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/car_info.dart';
import '../../domain/entities/car_short_info.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SearchCar searchCar;

  HomeBloc(this.searchCar) : super(HomeInitial()) {
    on<HomeSearchCarsEvent>((event, emit) async {
      emit(HomeLoading());
      final result = await searchCar(SearchCarParams(searchQuery: event.query));
      result.fold((failure) => emit(HomeError(failure: failure)), (
        responseOption,
      ) {
        responseOption.fold(
          () {
            emit(HomeInitial());
          },
          (response) {
            if (response is CarInfo) {
              emit(HomeLoaded(carInfo: response));
            } else if (response is List<CarShortInfo>) {
              emit(HomeLoadedList(carShortInfoList: response));
            } else {
              emit(HomeInitial());
            }
          },
        );
      });
    });
  }
}
