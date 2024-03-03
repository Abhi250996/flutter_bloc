import 'dart:async';

import 'package:bloc_demo/Screen/login_screen/login_screen.dart';
import 'package:bloc_demo/bloc/internet_bloc/internet_event.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../Manager/preference_manager/manager_preference.dart';
 import '../../bloc/internet_bloc/internet_bloc.dart';
import '../../bloc/internet_bloc/internet_state.dart';
import '../dashboard/dashboard.dart';
import 'no_internet.dart';



class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _preferenceManager = PreferenceManager.instance;
Timer? _timer;
  @override
  void initState() {
    isLoggedIn( );

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
        children: [

          BlocConsumer<InternetBloc, InternetState>(builder: (context,state){
            if (state is InternetLostState) {
              return NoInternetScreen(
                onRetry: () {
                  // Implement action to retry connecting to the internet
                  // For example, you might want to add an event to your bloc
                  // to trigger the retry action.
                  context.read<InternetBloc>().add(InternetGainedEvent());
                },
              );
            }
            return const SizedBox();
          }, listener: (context,state)
          {
            if (state is InternetGainedState) {

              Get.snackbar("Internet Connect", "Internet Connection found",
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.green, colorText: Colors.white);_timer?.cancel();
            }
          }),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }


  Container noInternet()
  {
    return Container(
      color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://www.how2shout.com/wp-content/uploads/2018/09/Internet-Access-Error.jpg', // Replace with your image path
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
           const SizedBox(height: 20),
          const  Text(
              'No Internet Connection',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
           const SizedBox(height: 20),

          ],
        ),
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
