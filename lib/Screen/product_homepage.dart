import 'package:bloc_demo/Screen/product_details.dart';
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
      backgroundColor: Colors.cyan,
      appBar: AppBar(title: const Text("BLOC")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.show_chart),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is ProductLoadedState) {
              return ListView.builder(
                  itemCount: state.products.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                          child: ListTile(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsScreen(
                                        id: state.products[index].id))),
                            leading: Text((index + 1).toString()),
                            title: Text(state.products[index].title.toString()),
                          ),
                        ),
                      ));
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
