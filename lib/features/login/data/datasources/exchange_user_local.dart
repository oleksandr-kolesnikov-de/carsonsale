/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class ExchangeUserLocal {
  Future<Either<Failure, bool>> saveUser(String userName);
  Future<Either<Failure, String>> loadUser();
}