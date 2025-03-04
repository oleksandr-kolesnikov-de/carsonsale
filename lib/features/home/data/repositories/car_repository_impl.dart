// ignore_for_file: avoid_print

/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/core/config/config.dart';
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
  Future<Either<Failure, Option<dynamic>>> searchCar(String searchQuery) async {
    final cacheResult = await _getCarFromCache(searchQuery);
    if (cacheResult.isRight() && cacheResult.getOrElse(() => None()) is Some) {
      return cacheResult;
    }
    return await _fetchCarFromRemote(searchQuery);
  }

  Future<Either<Failure, Option<CarInfoModel>>> _getCarFromCache(
    String query,
  ) async {
    final cacheResult = await exchangeCarLocal.getCar(query: query);
    return cacheResult.fold(
      (failure) {
        print("${AppStrings.debugCacheFailurePrefix}${failure.message}");
        return Right(None());
      },
      (response) {
        if (response is Some) {
          final data = response.value;
          if (data is Map) {
            try {
              final carInfoModel = CarInfoModel.fromMap(
                Map<String, dynamic>.from(data),
              );
              print(AppStrings.debugCacheHit);
              return Right(Some(carInfoModel));
            } catch (e) {
              print(AppStrings.debugCacheParseError);
            }
          }
        }
        return Right(None());
      },
    );
  }

  Future<Either<Failure, Option<dynamic>>> _fetchCarFromRemote(
    String searchQuery,
  ) async {
    final responseResult = await exchangeCarRemote.searchCar(searchQuery);
    return responseResult.fold((failure) => Left(failure), (response) {
      if (response.containsKey(Config.statusCodeKey) &&
          response.containsKey(Config.dataKey)) {
        if (response[Config.statusCodeKey] == 200) {
          final carData = response[Config.dataKey];
          try {
            final carInfoModel = CarInfoModel.fromMap(carData);
            // Store cache asynchronously
            exchangeCarLocal.storeCar(
              query: searchQuery,
              car: carInfoModel.toMap(),
            );
            return Right(Some(carInfoModel));
          } catch (e) {
            return Left(DecodeFailure());
          }
        } else if (response[Config.statusCodeKey] == 300) {
          final carDataList = response[Config.dataKey] as List;
          try {
            final carShortInfoModelList =
                carDataList.map((carData) {
                  return CarShortInfoModel.fromMap(carData);
                }).toList();
            return Right(Some(carShortInfoModelList));
          } catch (e) {
            return Left(DecodeFailure());
          }
        } else {
          return Left(ServerFailure());
        }
      }
      return Left(ServerFailure());
    });
  }
}
