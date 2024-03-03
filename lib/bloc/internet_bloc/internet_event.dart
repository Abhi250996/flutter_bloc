
import 'package:equatable/equatable.dart';

abstract class InternetEvent extends Equatable{
  const InternetEvent();
  @override
  List<Object?> get props => [];
 }

class InternetLostEvent extends InternetEvent{}
class InternetGainedEvent extends InternetEvent{}
