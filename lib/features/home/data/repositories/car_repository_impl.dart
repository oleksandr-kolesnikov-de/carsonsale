/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/features/home/domain/repositories/car_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../datasources/exchange_car_remote.dart';
import '../models/car_info_model.dart';
import '../models/car_short_info_model.dart';

class CarRepositoryImpl implements CarRepository {
  final ExchangeCarRemote exchangeCarRemote;

  CarRepositoryImpl({required this.exchangeCarRemote});

  @override
  Future<Either<Failure, Option<dynamic>>> searchCar(String searchQuery) async {
    try {
      final responseResult = await exchangeCarRemote.searchCar(searchQuery);

      return responseResult.fold((failure) => Left(failure), (response) {
        if (response.containsKey("statusCode") &&
            response.containsKey("data")) {
          if (response["statusCode"] == 200) {
            final carData = response["data"];
            final carInfoModel = CarInfoModel.fromMap(carData);
            final result = Some(carInfoModel);
            return Right(result);
          } else if (response["statusCode"] == 300) {
            final carDataList = response["data"] as List;
            final carShortInfoModelList =
                carDataList.map((carData) {
                  final carShortInfoModel = CarShortInfoModel.fromMap(carData);
                  return carShortInfoModel;
                }).toList();
            final carList = carShortInfoModelList;
            return Right(Some(carList));
          } else {
            return Left(ServerFailure());
          }
        } else {
          return Left(DecodeFailure());
        }
      });
    } catch (e) {
      return Left(DecodeFailure());
    }
  }
}
