import 'package:equatable/equatable.dart';

abstract class PhoneAuthEvent extends Equatable {
  const PhoneAuthEvent();

  @override
  List<Object?> get props => [];
}

class SubmitPhoneNumber extends PhoneAuthEvent {
  final String phoneNumber;

const  SubmitPhoneNumber(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class SubmitOTP extends PhoneAuthEvent {
  final String otp;

  const SubmitOTP(this.otp);

  @override
  List<Object?> get props => [otp];
}
