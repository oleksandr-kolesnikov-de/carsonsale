/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                           © 2025                                              */
/* ********************************************************************************************* */

import 'package:carsonsale/features/login/domain/usecases/clear_user.dart';
import 'package:carsonsale/features/login/domain/usecases/save_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/use_case/no_params.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SaveUser saveUser;
  final ClearUser clearUser;
  LoginBloc(this.saveUser, this.clearUser) : super(LoginInitial()) {
    on<SaveUserEvent>((event, emit) async {
      final result = await saveUser(SaveUserParams(userName: event.userName));
      result.fold(
        (failure) => emit(LoginInitial()),
        (response) => event.onSuccess(),
      );
    });

    on<ClearUserEvent>((event, emit) async {
      await clearUser(NoParams());
    });
  }
}
