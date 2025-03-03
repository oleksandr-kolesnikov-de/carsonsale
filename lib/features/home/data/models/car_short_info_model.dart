/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import '../../domain/entities/car_short_info.dart';

class CarShortInfoModel extends CarShortInfo {
  CarShortInfoModel({
    required super.make,
    required super.model,
    required super.externalId,
    required super.containerName,
    required super.similarity,
  });

  factory CarShortInfoModel.fromMap(Map<String, dynamic> map) {
    return CarShortInfoModel(
      make: map['make'],
      model: map['model'],
      externalId: map['externalId'],
      containerName: map['containerName'],
      similarity: map['similarity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'make': make,
      'model': model,
      'externalId': externalId,
      'containerName': containerName,
      'similarity': similarity,
    };
  }

  factory CarShortInfoModel.fromEntity(Map<String, dynamic> entity) {
    return CarShortInfoModel.fromMap(entity);
  }

  CarShortInfo toEntity() {
    return CarShortInfo(
      make: make,
      model: model,
      externalId: externalId,
      containerName: containerName,
      similarity: similarity,
    );
  }
}
