import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});
  
  @override
  List<Object?> get props => [message];
}

class LocalFailure extends Failure {
  const LocalFailure({super.message});
}

class RemoteFailure extends Failure {
  const RemoteFailure({super.message});
}

class DecodeFailure extends Failure {
  const DecodeFailure({super.message});
}

class SharedPreferencesFailure extends LocalFailure {
  const SharedPreferencesFailure({super.message});
}

class HiveFailure extends LocalFailure {
  const HiveFailure({super.message});
}

class ServerFailure extends RemoteFailure {
  const ServerFailure({super.message});
}

class TimeoutFailure extends RemoteFailure {
  const TimeoutFailure({super.message});
}

class AuthFailure extends RemoteFailure {
  const AuthFailure({super.message});
}

class UnknownFailure extends RemoteFailure {
  const UnknownFailure({super.message});
}