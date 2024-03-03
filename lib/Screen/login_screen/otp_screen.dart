import 'package:bloc_demo/Manager/preference_manager/manager_preference.dart';
import 'package:bloc_demo/bloc/bloc/phone_bloc/auth_bloc.dart';
import 'package:bloc_demo/bloc/bloc/phone_bloc/auth_event.dart';
import 'package:bloc_demo/bloc/bloc/phone_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../dashboard/dashboard.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<TextEditingController> controllers = List.generate(
    6,
        (index) => TextEditingController(),
  );
  final _preferenceManager =   PreferenceManager.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: BlocConsumer<AuthBloc,AuthState>(builder:(context,state){
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter OTP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  6,
                      (index) => SizedBox(
                    width: 40,
                    child: TextField(
                      controller: controllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: const InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: state is! AuthLoadingState ? () {
                  String otp = controllers.map((controller) => controller.text).join();

                  BlocProvider.of<AuthBloc>(context).add(OTPButtonPressed(otp));// Implement OTP verification logic

                  print('Entered OTP: $otp');
                }: null,
                child: const Text('Verify OTP'),
              ),
            ],
          ),
        );
      } ,listener: (context,state){

        if(state is AuthCodeVerifiedState)
          {
                        _preferenceManager.setUserOnDevice(state.user);
            _preferenceManager.setLogin(true);

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashboardScreen()));
          }
        else if (state is Unauthenticated)
          {
            Get.snackbar("Oops",state.message);
          }
        else if(state is AuthErrorState){
          Get.snackbar("Oops",state.error);

        }
      }) ,
    );
  }
}
