// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CarSearchResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarSearchResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CarSearchResult()';
}


}

/// @nodoc
class $CarSearchResultCopyWith<$Res>  {
$CarSearchResultCopyWith(CarSearchResult _, $Res Function(CarSearchResult) __);
}


/// @nodoc


class CarInfoResult implements CarSearchResult {
  const CarInfoResult(this.carInfo);
  

 final  CarInfo carInfo;

/// Create a copy of CarSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarInfoResultCopyWith<CarInfoResult> get copyWith => _$CarInfoResultCopyWithImpl<CarInfoResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarInfoResult&&(identical(other.carInfo, carInfo) || other.carInfo == carInfo));
}


@override
int get hashCode => Object.hash(runtimeType,carInfo);

@override
String toString() {
  return 'CarSearchResult.carInfo(carInfo: $carInfo)';
}


}

/// @nodoc
abstract mixin class $CarInfoResultCopyWith<$Res> implements $CarSearchResultCopyWith<$Res> {
  factory $CarInfoResultCopyWith(CarInfoResult value, $Res Function(CarInfoResult) _then) = _$CarInfoResultCopyWithImpl;
@useResult
$Res call({
 CarInfo carInfo
});




}
/// @nodoc
class _$CarInfoResultCopyWithImpl<$Res>
    implements $CarInfoResultCopyWith<$Res> {
  _$CarInfoResultCopyWithImpl(this._self, this._then);

  final CarInfoResult _self;
  final $Res Function(CarInfoResult) _then;

/// Create a copy of CarSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? carInfo = null,}) {
  return _then(CarInfoResult(
null == carInfo ? _self.carInfo : carInfo // ignore: cast_nullable_to_non_nullable
as CarInfo,
  ));
}


}

/// @nodoc


class CarListResult implements CarSearchResult {
  const CarListResult(final  List<CarShortInfo> carList): _carList = carList;
  

 final  List<CarShortInfo> _carList;
 List<CarShortInfo> get carList {
  if (_carList is EqualUnmodifiableListView) return _carList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_carList);
}


/// Create a copy of CarSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarListResultCopyWith<CarListResult> get copyWith => _$CarListResultCopyWithImpl<CarListResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarListResult&&const DeepCollectionEquality().equals(other._carList, _carList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_carList));

@override
String toString() {
  return 'CarSearchResult.carList(carList: $carList)';
}


}

/// @nodoc
abstract mixin class $CarListResultCopyWith<$Res> implements $CarSearchResultCopyWith<$Res> {
  factory $CarListResultCopyWith(CarListResult value, $Res Function(CarListResult) _then) = _$CarListResultCopyWithImpl;
@useResult
$Res call({
 List<CarShortInfo> carList
});




}
/// @nodoc
class _$CarListResultCopyWithImpl<$Res>
    implements $CarListResultCopyWith<$Res> {
  _$CarListResultCopyWithImpl(this._self, this._then);

  final CarListResult _self;
  final $Res Function(CarListResult) _then;

/// Create a copy of CarSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? carList = null,}) {
  return _then(CarListResult(
null == carList ? _self._carList : carList // ignore: cast_nullable_to_non_nullable
as List<CarShortInfo>,
  ));
}


}

/// @nodoc


class CarFailureResult implements CarSearchResult {
  const CarFailureResult(this.failure);
  

 final  Failure failure;

/// Create a copy of CarSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarFailureResultCopyWith<CarFailureResult> get copyWith => _$CarFailureResultCopyWithImpl<CarFailureResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarFailureResult&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'CarSearchResult.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CarFailureResultCopyWith<$Res> implements $CarSearchResultCopyWith<$Res> {
  factory $CarFailureResultCopyWith(CarFailureResult value, $Res Function(CarFailureResult) _then) = _$CarFailureResultCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$CarFailureResultCopyWithImpl<$Res>
    implements $CarFailureResultCopyWith<$Res> {
  _$CarFailureResultCopyWithImpl(this._self, this._then);

  final CarFailureResult _self;
  final $Res Function(CarFailureResult) _then;

/// Create a copy of CarSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(CarFailureResult(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
