/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2025                                               */
/* ********************************************************************************************* */

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class LocalFailure extends Failure {}

class RemoteFailure extends Failure {}

class DecodeFailure extends Failure {}

class SharedPreferencesFailure extends LocalFailure {}

class ServerFailure extends RemoteFailure {}


