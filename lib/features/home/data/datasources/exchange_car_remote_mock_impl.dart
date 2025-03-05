// ignore_for_file: avoid_print

/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'dart:async';
import 'dart:convert';

import 'package:carsonsale/core/api/end_point.dart';
import 'package:carsonsale/core/constants/app_strings.dart';
import 'package:carsonsale/mock/server.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../../../core/config/config.dart';
import '../../../../core/error/failure.dart';
import 'exchange_car_remote.dart';

class ExchangeCarRemoteMockImpl extends ExchangeCarRemote {
  //final CosChallenge cosChallenge;
  ExchangeCarRemoteMockImpl(
    //required this.cosChallenge,
  );

  @override
  Future<Either<Failure, Map<String, dynamic>>> searchCar(
    String searchQuery,
  ) async {
    int attempt = 0;
    while (attempt < Config.maxRetries) {
      try {
        final response = await CosChallenge.httpClient.get(
          Uri.https(EndPoint.authority, EndPoint.path, {'q': searchQuery}),
          headers: {CosChallenge.user: 'someUserId'},
        );
        print('Status code: ${response.statusCode} body:\n${response.body}');
        if ((response.statusCode == 200) || (response.statusCode == 300)) {
          final data = jsonDecode(_patchServerResponse(response.body));
          return Right({'data': data, 'statusCode': response.statusCode});
        } else {
          attempt++;
          if (attempt >= Config.maxRetries) {
            return Left(ServerFailure(message: AppStrings.errorMaxRetries));
          }
          await Future.delayed(Config.retryDelay);
        }
      } catch (e) {
        if (e is ClientException) {
          return Left(AuthFailure(message: e.message));
        } else if (e is TimeoutException) {
          attempt++;
          if (attempt >= Config.maxRetries) {
            return Left(ServerFailure(message: AppStrings.errorMaxRetries));
          }
          await Future.delayed(Config.retryDelay);
        } else {
          return Left(UnknownFailure(message: AppStrings.errorUnknown));
        }
      }
    }
    return Left(UnknownFailure(message: AppStrings.errorUnknown));
  }

  // Patch to fix the response body
  String _patchServerResponse(String responseBody) {
    String cleanedBody = responseBody.replaceAll(RegExp(r'\s+'), '');
    cleanedBody = cleanedBody.replaceAll(RegExp(r'""'), '","');
    return cleanedBody;
  }
}
