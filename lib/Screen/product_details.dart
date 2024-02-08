import 'package:bloc_demo/Widget/product_detail_widget.dart';
import 'package:bloc_demo/bloc/bloc/product_details_bloc.dart';
import 'package:bloc_demo/extension/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widget/product_details_image.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, this.id});

  final int? id;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    context.read<ProductDetailsBloc>().add(ProductDetailsLoadedEvent(widget.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Product Details",
            style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ProductDetailsLoadedState) {
            return ListView(
              children: [
                ProductDetailsImage(
                    image: state.productDetails.image.toString()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: getWidth(context) / 1.3,
                            child:
                                state.productDetails.title.productTitleText()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            state.productDetails.category
                                .toString()
                                .withCategoryText(fontSize: 36),
                            state.productDetails.price
                                .toString()
                                .withCurrencyDetailsText(),
                          ],
                        ),
                        ProductDetailsWidget(
                            value:
                                state.productDetails.description.toString()),
                      ],
                    ),
                  ),
                )
              ],
            );
          } else if (state is ProductDetailsErrorState) {
            return const Center(child: Text("Failed to load Data"));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
