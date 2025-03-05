/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import '../../domain/entities/car_info.dart';

class CarInfoModel extends CarInfo {
  CarInfoModel({
    required super.make,
    required super.model,
    required super.externalId,
    required super.feedback,
    required super.valuatedAt,
    required super.requestedAt,
    required super.createdAt,
    required super.updatedAt,
    required super.price,
    required super.positiveCustomerFeedback,
    required super.fkUuidAuction,
    required super.origin,
    required super.estimationRequestId,
    required super.fkSellerUser,
  });

  factory CarInfoModel.fromMap(Map<String, dynamic> map) {
    return CarInfoModel(
      make: map['make'] ?? 'Unknown',
      model: map['model'] ?? 'Unknown',
      externalId: map['externalId'] ?? 'Unknown',
      feedback: map['feedback'] ?? '',
      valuatedAt: DateTime.tryParse(map['valuatedAt'] ?? '') ?? DateTime.now(),
      requestedAt: DateTime.tryParse(map['requestedAt'] ?? '') ?? DateTime.now(),
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(map['updatedAt'] ?? '') ?? DateTime.now(),
      price: (map['price'] is double ? map['price'] : (map['price']?.toDouble() ?? 0.0)),
      positiveCustomerFeedback: map['positiveCustomerFeedback'] ?? false,
      fkUuidAuction: map['_fk_uuid_auction'] ?? '',
      origin: map['origin'] ?? '',
      estimationRequestId: map['estimationRequestId'] ?? '',
      fkSellerUser: map['_fk_sellerUser'] ?? '', // Handle new field
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'make': make,
      'model': model,
      'externalId': externalId,
      'feedback': feedback,
      'valuatedAt': valuatedAt.toIso8601String(),
      'requestedAt': requestedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'price': price,
      'positiveCustomerFeedback': positiveCustomerFeedback,
      'fkUuidAuction': fkUuidAuction,
      'origin': origin,
      'estimationRequestId': estimationRequestId,
      '_fk_sellerUser': fkSellerUser, 
    };
  }

  CarInfo toEntity() {
    return CarInfo(
      make: make,
      model: model,
      externalId: externalId,
      feedback: feedback,
      valuatedAt: valuatedAt,
      requestedAt: requestedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      price: price,
      positiveCustomerFeedback: positiveCustomerFeedback,
      fkUuidAuction: fkUuidAuction,
      origin: origin,
      estimationRequestId: estimationRequestId,
      fkSellerUser: fkSellerUser, 
    );
  }
}
