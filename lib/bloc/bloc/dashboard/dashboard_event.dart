import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardLoadedEvent extends DashboardEvent {
  final String mobNo;

  DashboardLoadedEvent(this.mobNo);

  @override
  List<Object?> get props => [mobNo];
}
