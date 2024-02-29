import 'package:bloc/bloc.dart';
import 'package:bloc_demo/Repository/product_repo.dart';
import 'package:bloc_demo/Model/product_model.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductLoadedEvent, ProductState> {
  ProductRepo productRepo;
  List<ProductModel> productList = [];

  ProductBloc(this.productRepo) : super(ProductLoadingState()) {
    on<ProductLoadedEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());

        productList = await productRepo.getProducts();

        emit(ProductLoadedState(productList));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }

 }
