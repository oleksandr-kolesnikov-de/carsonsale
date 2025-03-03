/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2025                                               */
/* ********************************************************************************************* */

import 'package:dartz/dartz.dart';

import '../error/failure.dart';

// [UseCase] is an abstract class that contains the list of all possible use cases.
// It is used to handle use cases in the application.

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
