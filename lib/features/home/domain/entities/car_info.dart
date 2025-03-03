/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/features/home/domain/entities/base_car.dart';

class CarInfo extends BaseCarInfo {
  final String feedback;
  final DateTime valuatedAt;
  final DateTime requestedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double price;
  final bool positiveCustomerFeedback;
  final String fkUuidAuction;
  final String origin;
  final String estimationRequestId;

  CarInfo({
    required super.make,
    required super.model,
    required super.externalId,
    required this.feedback,
    required this.valuatedAt,
    required this.requestedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.price,
    required this.positiveCustomerFeedback,
    required this.fkUuidAuction,
    required this.origin,
    required this.estimationRequestId,
  });
}