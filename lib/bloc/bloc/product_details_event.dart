part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];

}

class ProductDetailsLoadedEvent extends Equatable{

  final int id;
  const ProductDetailsLoadedEvent(this.id);

  @override
  List<Object> get props=>[];
}
