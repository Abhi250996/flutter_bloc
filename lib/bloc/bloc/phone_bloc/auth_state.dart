
import '../../../Model/user.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}
class AuthMobileVerifiedState extends AuthState {}
class AuthFailedState extends AuthState {}

class AuthCodeSentState extends AuthState {}

class AuthCodeVerifiedState extends AuthState {
  final User user;

    AuthCodeVerifiedState(this.user);
  List<Object?> get props => [];
}

class AuthLoggedInState extends AuthState {
   AuthLoggedInState();
}

class Unauthenticated extends AuthState {
  final String message;
   Unauthenticated(this.message);
}

class AuthLoggedOutState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
}