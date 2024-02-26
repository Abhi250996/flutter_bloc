import 'package:bloc_demo/Widget.dart';
import 'package:bloc_demo/bloc/bloc/product_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int id;

  const ProductDetailsScreen({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    context
        .read<ProductDetailsBloc>()
        .add(ProductDetailsLoadedEvent(widget.id));
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
      backgroundColor: Colors.cyan,
      body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ProductDetailsLoadedState) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        children: [
                          ProductDetailsWidget(
                              label: "Id", value: widget.id.toString()),
                          ProductDetailsWidget(
                              label: "Title",
                              value: state.productDetails.title.toString()),
                          ProductDetailsWidget(
                              label: "Price",
                              value: state.productDetails.price.toString()),
                          ProductDetailsWidget(
                              label: "Description",
                              value:
                                  state.productDetails.description.toString()),
                          ProductDetailsWidget(
                              label: "Category",
                              value: state.productDetails.category.toString()),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.black),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          state.productDetails.image),
                                      fit: BoxFit.cover)),
                            ),
                          )

                          // ProductDetailsWidget(
                          //     label: "Image",
                          //     value: state.productDetails.image.toString()),
                        ],
                      ),
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
