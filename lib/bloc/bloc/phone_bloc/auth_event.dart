import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginButtonPressed extends AuthEvent {
  final String phoneNumber;

  const LoginButtonPressed(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class OTPButtonPressed extends AuthEvent {
  final String otp;

  const OTPButtonPressed(this.otp);

  @override
  List<Object?> get props => [otp];
}

class LogoutButtonPressed extends AuthEvent {}
