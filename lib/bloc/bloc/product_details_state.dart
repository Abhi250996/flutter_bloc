part of 'product_details_bloc.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();
  
  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}
final class ProductDetailsLoadingState extends ProductDetailsState {}
final class ProductDetailsLoadedState extends ProductDetailsState {

 final ProductDetails productDetails;

 const ProductDetailsLoadedState(this.productDetails);

  
}
final class ProductDetailsErrorState extends ProductDetailsState {

  final String errorMsg;

  const ProductDetailsErrorState(this.errorMsg);
}


