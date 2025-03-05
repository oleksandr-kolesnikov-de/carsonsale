// ignore_for_file: avoid_print

/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/core/config/config.dart';
import 'package:carsonsale/features/home/domain/entities/car_search_result.dart';
import 'package:carsonsale/features/home/domain/repositories/car_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/error/failure.dart';
import '../datasources/exchange_car_local.dart';
import '../datasources/exchange_car_remote.dart';
import '../models/car_info_model.dart';
import '../models/car_short_info_model.dart';

class CarRepositoryImpl implements CarRepository {
  final ExchangeCarRemote exchangeCarRemote;
  final ExchangeCarLocal exchangeCarLocal;

  CarRepositoryImpl(this.exchangeCarLocal, this.exchangeCarRemote);

  @override
  Future<CarSearchResult> searchCar(String searchQuery) async {
    final cacheResult = await _getCarFromCache(searchQuery);
    if (cacheResult != null) {
      return cacheResult; // Found in cache
    }
    return await _fetchCarFromRemote(searchQuery);
  }

  Future<CarSearchResult?> _getCarFromCache(String query) async {
    final cacheResult = await exchangeCarLocal.getCar(query: query);
    return cacheResult.fold(
      (failure) {
        print("${AppStrings.debugCacheFailurePrefix}${failure.message}");
        return null; // Cache failure, fallback to remote
      },
      (response) {
        if (response is Some) {
          try {
            final carInfoModel = CarInfoModel.fromMap(
              Map<String, dynamic>.from(response.value),
            );
            print(AppStrings.debugCacheHit);
            return CarSearchResult.carInfo(carInfoModel);
          } catch (e) {
            print(AppStrings.debugCacheParseError);
          }
        }
        return null; // Not found in cache
      },
    );
  }

  Future<CarSearchResult> _fetchCarFromRemote(String searchQuery) async {
    final responseResult = await exchangeCarRemote.searchCar(searchQuery);
    return responseResult.fold((failure) => CarSearchResult.failure(failure), (
      response,
    ) {
      if (response.containsKey(Config.statusCodeKey) &&
          response.containsKey(Config.dataKey)) {
        if (response[Config.statusCodeKey] == 200) {
          // Single car info case
          try {
            final carInfoModel = CarInfoModel.fromMap(response[Config.dataKey]);
            exchangeCarLocal.storeCar(
              query: searchQuery,
              car: carInfoModel.toMap(),
            ); // Store in cache asynchronously
            return CarSearchResult.carInfo(carInfoModel);
          } catch (e) {
            return CarSearchResult.failure(
              DecodeFailure(),
            ); // Single car info decode failure
          }
        } else if (response[Config.statusCodeKey] == 300) {
          // Multiple car results case
          try {
            final carDataList = response[Config.dataKey] as List;
            final carShortInfoModelList =
                carDataList.map((carData) {
                  return CarShortInfoModel.fromMap(carData);
                }).toList();
            return CarSearchResult.carList(carShortInfoModelList);
          } catch (e) {
            return CarSearchResult.failure(
              DecodeFailure(),
            ); // Multiple car results decode failure
          }
        } else {
          return CarSearchResult.failure(
            ServerFailure(),
          ); // Unknown status code
        }
      }
      return CarSearchResult.failure(ServerFailure()); // Response format error
    });
  }
}
