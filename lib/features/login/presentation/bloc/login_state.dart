/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();  

  @override
  List<Object> get props => [];
}
class LoginInitial extends LoginState {}
