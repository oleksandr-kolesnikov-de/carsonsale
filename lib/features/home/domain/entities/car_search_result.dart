/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/features/home/domain/entities/car_info.dart';
import 'package:carsonsale/features/home/domain/entities/car_short_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';

part 'car_search_result.freezed.dart';

@freezed
sealed class CarSearchResult with _$CarSearchResult {
  const factory CarSearchResult.carInfo(CarInfo carInfo) = CarInfoResult;
  const factory CarSearchResult.carList(List<CarShortInfo> carList) = CarListResult;
  const factory CarSearchResult.failure(Failure failure) = CarFailureResult;
}
