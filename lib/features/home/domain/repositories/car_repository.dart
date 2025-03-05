/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/features/home/domain/entities/car_search_result.dart';

abstract class CarRepository {
  Future<CarSearchResult> searchCar(String searchQuery);
}
