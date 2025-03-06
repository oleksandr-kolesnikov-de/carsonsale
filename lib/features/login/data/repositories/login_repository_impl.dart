/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/exchange_user_local.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ExchangeUserLocal exchangeLocal;

  LoginRepositoryImpl(this.exchangeLocal);

  @override
  Future<Either<Failure, bool>> saveUser(String userName) async {
    final response = await exchangeLocal.saveUser(userName);
    return response.fold(
      (failure) => Left(failure),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failure, String>> loadUser() async {
    final response = await exchangeLocal.loadUser();
    return response.fold(
      (failure) => Left(failure),
      (response) => Right(response),
    );
  }
}