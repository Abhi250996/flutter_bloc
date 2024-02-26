import 'package:bloc_demo/Model/user.dart';


// Splash States
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashAuthenticated extends SplashState {
  final User user;

  SplashAuthenticated(this.user);
}

class SplashUnauthenticated extends SplashState {}
