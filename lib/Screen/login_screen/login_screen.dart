import 'package:bloc_demo/bloc/bloc/phone_bloc/auth_bloc.dart';
import 'package:bloc_demo/bloc/bloc/phone_bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

 import '../../bloc/bloc/phone_bloc/auth_event.dart';
import 'otp_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            return Center(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                controller: _phoneController,
                                decoration: const InputDecoration(
                                  labelText: 'Phone Number',
                                ),
                              ),
                              const SizedBox(height: 20.0),
                              ElevatedButton(
                                onPressed: state is! AuthLoadingState
                                    ? () {
                                        BlocProvider.of<AuthBloc>(context).add(
                                          LoginButtonPressed(
                                            _phoneController.text,
                                          ),
                                        );
                                      }
                                    : null,
                                child: state is AuthLoadingState
                                    ? const Center(
                                        child: CircularProgressIndicator
                                            .adaptive())
                                    : const Text('Login'),
                              ),
                            ]))));
          },
          listener: (context, state) {
            if (state is AuthMobileVerifiedState) {
              Get.to(OTPScreen());
            } else if (state is Unauthenticated) {
              Get.snackbar("Opps!", state.message,
                  colorText: Colors.white, backgroundColor: Colors.red);
            } else if (state is AuthErrorState) {
              Get.snackbar("Error", state.error,
                  colorText: Colors.white, backgroundColor: Colors.red);
            }
          },
        ));
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}

// import 'package:bloc_demo/Screen/dashboard/dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../Manager/preference_manager/manager_preference.dart';
// import '../../bloc/bloc/login_bloc/login_bloc.dart';
// import '../../bloc/bloc/login_bloc/login_event.dart';
// import '../../bloc/bloc/login_bloc/login_state.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _preferenceManager = PreferenceManager.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: BlocConsumer<LoginBloc, LoginState>(
//         listener: (context, state) {
//          if (state is LoginSuccessState) {
//             _preferenceManager.setUserOnDevice(state.user);
//             _preferenceManager.setLogin(true);
//
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const DashboardScreen()),
//             );
//           } else if (state is LoginErrorState) {
//             // Show error message
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.error),
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Center(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(
//                         labelText: 'Email',
//                       ),
//                     ),
//                     const SizedBox(height: 10.0),
//                     TextField(
//                       controller: _passwordController,
//                       decoration: const InputDecoration(
//                         labelText: 'Password',
//                       ),
//                       obscureText: true,
//                     ),
//                     const SizedBox(height: 20.0),
//                     ElevatedButton(
//                       onPressed: state is! LoginLoadingState
//                           ? () {
//                               BlocProvider.of<LoginBloc>(context).add(
//                                 LoginButtonPressed(
//                                   _emailController.text,
//                                   _passwordController.text,
//                                 ),
//                               );
//                             }
//                           : null,
//                       child: state is LoginLoadingState
//                           ? const Center(
//                               child: CircularProgressIndicator.adaptive())
//                           : const Text('Login'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }
