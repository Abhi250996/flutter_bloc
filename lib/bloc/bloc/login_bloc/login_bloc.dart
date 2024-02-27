import 'package:bloc/bloc.dart';

import '../../../Manager/preference_manager/manager_preference.dart';
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
  final _preferenceManager = PreferenceManager.instance;

  LoginBloc() : super(InitialLoginState()) {
    on<LoginButtonPressed>((event, emit) async{
      emit(LoginLoadingState());
      try {
        final user = await UserApi.getUser(event.email, event.password);
        emit(LoginSuccessState(user));

      } catch (error) {
        emit(LoginErrorState(error.toString()));
      }
    });
  }
}
