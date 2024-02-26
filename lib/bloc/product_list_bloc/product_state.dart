part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class BlocInitial extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductLoadedState extends ProductState {
  final List<ProductModel> products;

  const ProductLoadedState(this.products);

  @override
  List<Object> get props => [products];
}

final class ProductErrorState extends ProductState {
  final String errorMessage;

  const ProductErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
