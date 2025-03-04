/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ExchangeCarLocal {
  Future<Either<Failure, bool>> storeCar({
    required String query,
    required Map<String, dynamic> car,
  });
  Future<Either<Failure, Option>> getCar({
    required String query,
  });
}
