// ignore_for_file: avoid_print

/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'dart:async';
import 'package:carsonsale/features/home/data/datasources/exchange_car_local.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import '../../../../core/config/config.dart';
import '../../../../core/error/failure.dart';

class ExchangeCarLocalHiveImpl extends ExchangeCarLocal {
  ExchangeCarLocalHiveImpl();

  @override
  Future<Either<Failure, bool>> storeCar({
    required String query,
    required Map<String, dynamic> car,
  }) async {
    try {
      var box = await Hive.openBox<Map>(Config.hiveBoxName);
      await box.put(query, car);
    } catch (e) {
      return Left(HiveFailure(message: e.toString()));
    }
    return Right(true);
  }

  @override
  Future<Either<Failure, Option>> getCar({
    required String query,
  }) async {
    try {
      var box = await Hive.openBox<Map>(Config.hiveBoxName);
      var car = box.get(query);
      if (car == null) {
        return Right(None());
      }
      return Right(Some(car));
    } catch (e) {
      return Left(HiveFailure(message: e.toString()));
    }
  }
}
