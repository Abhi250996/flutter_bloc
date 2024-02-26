import 'package:bloc_demo/Screen/login_screen/login_screen.dart';
import 'package:bloc_demo/bloc/bloc/splash_bloc/splash_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/splash_bloc/splash_bloc.dart';
import '../../bloc/bloc/splash_bloc/splash_state.dart';
import '../dashboard/dashboard.dart';

class SplashScreen extends StatelessWidget {
  final SplashBloc splashBloc;
  final int userId;

  SplashScreen({super.key, required this.splashBloc, required this.userId}) {
    splashBloc.add(SplashCheckAuthentication(userId: userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      bloc: splashBloc,
      listener: (context, state) {
        if (state is SplashAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => DashboardScreen(user: state.user),
            ),
          );
        } else if (state is SplashUnauthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const LoginPage(),
            ),
          );
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
