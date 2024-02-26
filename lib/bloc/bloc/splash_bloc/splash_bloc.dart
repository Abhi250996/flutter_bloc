import 'package:bloc/bloc.dart';
import 'package:bloc_demo/bloc/bloc/splash_bloc/splash_event.dart';
import 'package:bloc_demo/bloc/bloc/splash_bloc/splash_state.dart';

import '../../../Repository/user_repository.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserApi userApi;

  SplashBloc({required this.userApi}) : super(SplashInitial()) {
    on<SplashCheckAuthentication>((event, emit) async {
      emit(SplashLoading());
      try {
        final user = await UserApi2.getUser(event.userId); // Use user ID from the event
        emit(SplashAuthenticated(user));
      } catch (error) {
        emit(SplashUnauthenticated());
      }
    });
}
}