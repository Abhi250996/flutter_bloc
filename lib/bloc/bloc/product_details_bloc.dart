import 'package:bloc/bloc.dart';
import 'package:bloc_demo/Model/product_details.dart';
import 'package:bloc_demo/Repository/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_details_event.dart';

part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsLoadedEvent, ProductDetailsState> {
  final ProductRepo productRepo;

  ProductDetailsBloc(this.productRepo) : super(ProductDetailsInitial()) {
    on<ProductDetailsLoadedEvent>((event, emit) async {
      try {
        var id = event.id;
        emit(ProductDetailsLoadingState());
        ProductDetails productDetails =
            await productRepo.getProductDetails(id.toString());
        emit(ProductDetailsLoadedState(productDetails));
      } catch (e) {
        emit(ProductDetailsErrorState(e.toString()));
      }
    });
  }
}
