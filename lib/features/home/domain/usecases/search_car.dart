/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/features/home/domain/entities/car_search_result.dart';

import '../../../../core/use_case/use_case.dart';
import '../repositories/car_repository.dart';

class SearchCar implements UseCase<CarSearchResult, SearchCarParams> {
  final CarRepository repository; 

  SearchCar(this.repository);

  @override
  Future<CarSearchResult> call(
    SearchCarParams params) async {
    return await repository.searchCar(params.searchQuery);
  }
}

class SearchCarParams {
  final String searchQuery;

  SearchCarParams({required this.searchQuery});
}
