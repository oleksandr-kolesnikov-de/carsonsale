/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/no_params.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/login_repository.dart';


class ClearUser implements UseCase<Either<Failure, bool>, NoParams> {
  final LoginRepository repository;
  ClearUser(this.repository);

  @override
  Future<Either<Failure, bool>> call(
    NoParams params) async {
    return await repository.clearUser();
  }
}
