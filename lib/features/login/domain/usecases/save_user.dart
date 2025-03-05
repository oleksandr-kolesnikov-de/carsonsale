/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/login_repository.dart';


class SaveUser implements UseCase<Either<Failure, bool>, SaveUserParams> {
  final LoginRepository repository;
  SaveUser(this.repository);

  @override
  Future<Either<Failure, bool>> call(
    SaveUserParams params) async {
    return await repository.saveUser(params.userName);
  }
}

class SaveUserParams {
  final String userName;

  SaveUserParams({required this.userName});
}
