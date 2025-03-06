/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/no_params.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/login_repository.dart';


class LoadUser implements UseCase<Either<Failure, String>, NoParams> {
  final LoginRepository repository;
  LoadUser(this.repository);

  @override
  Future<Either<Failure, String>> call(
    NoParams params) async {
    return await repository.loadUser();
  }
}


