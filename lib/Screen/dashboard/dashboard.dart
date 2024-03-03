import 'dart:async';

import 'package:bloc_demo/Screen/login_screen/login_screen.dart';
import 'package:bloc_demo/bloc/bloc/dashboard/dashboard_bloc.dart';
import 'package:bloc_demo/bloc/bloc/dashboard/dashboard_event.dart';
import 'package:bloc_demo/bloc/bloc/dashboard/dashboard_state.dart';
import 'package:bloc_demo/bloc/bloc/phone_bloc/auth_bloc.dart';
import 'package:bloc_demo/bloc/bloc/phone_bloc/auth_event.dart';
import 'package:bloc_demo/bloc/bloc/phone_bloc/auth_state.dart';
import 'package:bloc_demo/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_demo/bloc/internet_bloc/internet_state.dart';
import 'package:bloc_demo/bloc/product_list_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../Widget/gridview_widget.dart';
import '../../bloc/bloc/product_details_bloc.dart';
import 'screen2.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    context.read<DashboardBloc>().add(DashboardLoadedEvent("10"));
    context.read<ProductBloc>().add(ProductLoadedEvent());
    context.read<ProductDetailsBloc>().add(const ProductDetailsLoadedEvent(10));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _scaffoldKey,
      backgroundColor: Colors.cyan.withOpacity(0.9),
      floatingActionButton: BlocListener<AuthBloc,AuthState>(listener: (context,state)
        {
          if(state is AuthLoggedOutState){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
          }
        }
        ,child: FloatingActionButton(onPressed: (){
        BlocProvider.of<AuthBloc>(context).add(LogoutButtonPressed());

      },child: const Icon(Icons.logout)),),
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Screen2()));
              },
              icon: const Icon(Icons.person_add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
              if (state is LoadingDashboardState) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (state is LoadedDashboardState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(state.user.avatar!),
                        radius: 50,
                      ),
                      const SizedBox(height: 20),
                      Text(
                          'Name: ${state.user.firstName} ${state.user.lastName}'),
                      Text('Email: ${state.user.email}'),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Screen2()));
                        },
                        child: const Text("Press Me"),
                      )
                    ],
                  ),
                );
              } else if (state is ErrorDashboardState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
              return const SizedBox();
            }),
            BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
                builder: (context, state) {
              if (state is ProductDetailsLoadingState) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (state is ProductDetailsLoadedState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(state.productDetails.image),
                        radius: 50,
                      ),
                      const SizedBox(height: 20),
                      Text('Name: ${state.productDetails.title} '),
                      Text('Description: ${state.productDetails.category}'),
                      Text('Description: ${state.productDetails.description}'),
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Screen2()));
                        },
                        child: const Text("Press Me"),
                      )
                    ],
                  ),
                );
              } else if (state is ProductErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Failed to Load Data")));
              }
              return const SizedBox();
            }),
            BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
              if (state is ProductLoadingState) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (state is ProductLoadedState) {
                return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                          child: ProductWidget(
                              title: data.title.toString(),
                              category: data.category.toString(),
                              price: data.price.toString(),
                              productImage: data.image),
                        ),
                      );
                    });
              } else if (state is ProductErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Failed to Load Data")));
              }
              return const SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
