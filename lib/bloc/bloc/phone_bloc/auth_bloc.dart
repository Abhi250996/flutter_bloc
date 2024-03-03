import 'package:bloc/bloc.dart';
import 'package:bloc_demo/Manager/preference_manager/manager_preference.dart';
import 'package:bloc_demo/Repository/mobile_check.dart';
import 'package:bloc_demo/Repository/user_repository.dart';
import 'package:bloc_demo/bloc/bloc/phone_bloc/auth_state.dart';

import 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final _preferenceManager = PreferenceManager.instance;
  AuthBloc() : super(AuthInitialState()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(AuthLoadingState());

      try {
        final data = await MobileExistRepository.loadJsonData();

        if (data['exists'] == true) {
          emit(AuthMobileVerifiedState());

          // Call Send OTP API
        } else {
          emit(Unauthenticated(data['message']));
        }
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });
    on<OTPButtonPressed>((event, emit) async {
      emit(AuthLoadingState());

      try {
        final user = await UserApi.getUser(event.otp);

        if (event.otp == "123456") {
          emit(AuthCodeVerifiedState(user));
        } else {
          emit(AuthErrorState("OTP Not Matched"));
        }
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    }); on<LogoutButtonPressed>((event, emit) async {
      emit(AuthLoadingState());

      _preferenceManager.logOut();
      emit(AuthLoggedOutState());
    });
  }

}
