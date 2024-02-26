import 'package:bloc_demo/Screen/product_details.dart';
import 'package:bloc_demo/Widget/drawer_widget.dart';
import 'package:bloc_demo/Widget/gridview_widget.dart';
import 'package:bloc_demo/app_constants.dart';
import 'package:bloc_demo/bloc/product_list_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHomePage extends StatefulWidget {
  const BlocHomePage({super.key});

  @override
  State<BlocHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BlocHomePage> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.withOpacity(.6),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(StringConstants.appTitle),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.show_chart),
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is ProductLoadedState) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      childAspectRatio: 0.9),
                  itemCount: state.products.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = state.products[index];
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                        id: state.products[index].id))),
                            child: ProductWidget(
                                title: data.title,
                                category: data.category.toString(),
                                price: data.price.toString(),
                                productImage: data.image)),
                      ),
                    );
                  });
            } else if (state is ProductErrorState) {
              Center(child: Text(state.errorMessage));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
