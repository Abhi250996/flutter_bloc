import 'package:bloc_demo/Screen/login_screen/login_screen.dart';
import 'package:bloc_demo/bloc/bloc/splash_bloc/splash_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../Manager/preference_manager/manager_preference.dart';
import '../../bloc/bloc/splash_bloc/splash_bloc.dart';
import '../../bloc/bloc/splash_bloc/splash_state.dart';
import '../dashboard/dashboard.dart';



class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _preferenceManager = PreferenceManager.instance;

  @override
  void initState() {
    isLoggedIn( );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  Future<void> isLoggedIn( ) async {
    var isLoggedIn = await _preferenceManager.isLogin();
    if (isLoggedIn) {
      Get.to(const DashboardScreen());
    } else {
      Get.to(const LoginPage());
    }
  }
}
