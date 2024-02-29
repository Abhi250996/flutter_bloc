import 'package:equatable/equatable.dart';

import '../../../Model/product_model.dart';
import '../../../Model/user.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class InitialDashboardState extends DashboardState {}

class LoadingDashboardState extends DashboardState {}

class LoadedDashboardState extends DashboardState {
  final User user;
   const LoadedDashboardState(this.user);

  @override
  List<Object?> get props => [user];
}

class ErrorDashboardState extends DashboardState {
  final String error;

  const ErrorDashboardState(this.error);

  @override
  List<Object?> get props => [error];
}
