/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ExchangeCarRemote {
  Future<Either<Failure, Map<String, dynamic>>> searchCar(String searchQuery);
}