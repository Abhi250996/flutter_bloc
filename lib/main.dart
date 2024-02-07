import 'package:bloc_demo/Repository/product_repo.dart';
import 'package:bloc_demo/Screen/product_homepage.dart';
import 'package:bloc_demo/bloc/bloc/product_details_bloc.dart';
import 'package:bloc_demo/bloc/product_list_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => ProductRepo(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(ProductRepo()),
        ),
        BlocProvider(
          create: (context) => ProductDetailsBloc(ProductRepo()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BlocHomePage(),
      ),
    );
  }
}
