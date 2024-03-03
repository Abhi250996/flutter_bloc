
import 'package:equatable/equatable.dart';

abstract class InternetState extends Equatable{
  const InternetState();
  @override
  List<Object?> get props => [];
}
class InternetInitialState extends InternetState{}
class InternetLostState extends InternetState{}
class InternetGainedState extends InternetState{}
