import 'package:bloc_demo/Model/user.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class InitialLoginState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final User user;

  const LoginSuccessState(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginErrorState extends LoginState {
  final String error;

  const LoginErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
