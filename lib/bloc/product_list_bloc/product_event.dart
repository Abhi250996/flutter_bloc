part of 'product_bloc.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

class ProductLoadedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
