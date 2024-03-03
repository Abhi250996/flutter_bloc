import 'package:equatable/equatable.dart';

abstract class PhoneAuthState extends Equatable {
  const PhoneAuthState();

  @override
  List<Object?> get props => [];
}

class InitialPhoneAuthState extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneNumberSubmitted extends PhoneAuthState {}

class OTPSent extends PhoneAuthState {}

class OTPVerified extends PhoneAuthState {}

class OTPFailed extends PhoneAuthState {}

class PhoneAuthError extends PhoneAuthState {
  final String errorMessage;

  const PhoneAuthError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
