/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'base_car.dart';

class CarShortInfo extends BaseCarInfo {
  final String containerName;
  final int similarity;

  CarShortInfo({
    required super.make,
    required super.model,
    required super.externalId,
    required this.containerName,
    required this.similarity,
  });
}