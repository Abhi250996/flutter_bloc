import 'package:bloc/bloc.dart';

import '../../../Repository/user_repository.dart';
import 'login_event.dart';
import 'login_state.dart';
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(InitialLoginState());
//
//   @override
//   Stream<LoginState> mapEventToState(LoginEvent event) async* {
//     if (event is LoginButtonPressed) {
//       emit(LoginLoadingState());
//       try {
//         final user = await UserApi.getUser(10); // Use email and password from the event
//         emit(LoginSuccessState(user));
//       } catch (error) {
//         emit(LoginErrorState(error.toString()));
//       }
//     }
//   }
// }


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      emit(LoginLoadingState());
      try {
        final user = await UserApi.getUser(event.email, event.password); // Use email and password from the event
        emit(LoginSuccessState(user));
      } catch (error) {
        emit(LoginErrorState(error.toString()));
      }
    }
  }
}
