import 'package:bloc_demo/Repository/product_repo.dart';
import 'package:bloc_demo/bloc/bloc/product_details_bloc.dart';
import 'package:bloc_demo/bloc/product_list_bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Repository/user_repository.dart';
import 'Screen/splash_screen/splash_screen.dart';
import 'bloc/bloc/splash_bloc/splash_bloc.dart';
void main() {
  final SplashBloc splashBloc = SplashBloc(userApi: UserApi());

  runApp(RepositoryProvider(
    create: (context) => ProductRepo(),
    child: MyApp(splashBloc: splashBloc),
  ));
}

class MyApp extends StatelessWidget {
  final SplashBloc splashBloc;

  const MyApp({Key? key, required this.splashBloc}) : super(key: key);

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
        home: SplashScreen(splashBloc: splashBloc,userId: 10),
      ),
    );
  }
}
