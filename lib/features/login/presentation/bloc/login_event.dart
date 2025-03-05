/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SaveUserEvent extends LoginEvent {
  final String userName;
  final Function onSuccess;

  const SaveUserEvent({required this.userName, required this.onSuccess});

  @override
  List<Object> get props => [userName, onSuccess];
} 
