/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/car_repository.dart';

class SearchCar implements UseCase<Option, SearchCarParams> {
  final CarRepository repository; 

  SearchCar(this.repository);

  @override
  Future<Either<Failure, Option<dynamic>>> call(
    SearchCarParams params) async {
    return await repository.searchCar(params.searchQuery);
  }
}

class SearchCarParams {
  final String searchQuery;

  SearchCarParams({required this.searchQuery});
}
