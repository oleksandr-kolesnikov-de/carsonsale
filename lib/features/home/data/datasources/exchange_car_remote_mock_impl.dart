// ignore_for_file: avoid_print

/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'dart:convert';

import 'package:carsonsale/mock/server.dart';
import 'package:dartz/dartz.dart';

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
    try {
      final response = await CosChallenge.httpClient.get(
        Uri.https('anyUrl'),
        headers: {CosChallenge.user: 'someUserId'},
      );
      print('Status code: ${response.statusCode} body:\n${response.body}');
      if ((response.statusCode == 200) || (response.statusCode == 300)) {
        String cleanedBody = response.body.replaceAll(RegExp(r'\s+'), '');
        // Patch to fix the response body
        cleanedBody = cleanedBody.replaceAll(RegExp(r'""'), '","');
        // *****************************
        print("Cleaned body:\n$cleanedBody");
        final data = jsonDecode(cleanedBody);
        return Right({'data': data, 'statusCode': response.statusCode});
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
