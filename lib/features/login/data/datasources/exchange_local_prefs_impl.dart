/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/core/config/config.dart';
import 'package:carsonsale/features/login/data/datasources/exchange_user_local.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failure.dart';

class ExchangeLocalPrefsImpl extends ExchangeUserLocal {
  final SharedPreferences sharedPreferences;
  ExchangeLocalPrefsImpl(this.sharedPreferences);

  @override
  Future<Either<Failure, bool>> saveUser(String userName) async {
    try {
      await sharedPreferences.setString(
        Config.sharedPrefsUserNameKey,
        userName,
      );
      return Right(true);
    } catch (e) {
      return Left(SharedPreferencesFailure());
    }
  }

  @override
  Future<Either<Failure, String>> loadUser() async {
    try {
      final user = sharedPreferences.getString(Config.sharedPrefsUserNameKey);
      if (user != null) {
        return Right(user);
      } else {
        return Left(SharedPreferencesFailure());
      }
    } catch (e) {
      return Left(SharedPreferencesFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> clearUser() async {
    try {
      await sharedPreferences.remove(Config.sharedPrefsUserNameKey);
      return Right(true);
    } catch (e) {
      return Left(SharedPreferencesFailure());
    }
  }
}
