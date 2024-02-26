import 'package:bloc_demo/Screen/dashboard/dashboard.dart';
import 'package:bloc_demo/bloc/bloc/user_bloc/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/user_bloc/login_bloc.dart';
import '../../bloc/bloc/user_bloc/login_state.dart';
import '../product_homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              // Show loading indicator
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Center(child: CircularProgressIndicator());
                },
              );
            } else if (state is LoginSuccessState) {
              // Navigate to next screen or display success message
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DashboardScreen(
                          user: state.user,
                        )),
              );
            } else if (state is LoginErrorState) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20.0),
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state is! LoginLoadingState
                              ? () {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    LoginButtonPressed(
                                      _emailController.text,
                                      _passwordController.text,
                                    ),
                                  );
                                }
                              : null,
                          child: Text(state is LoginLoadingState
                              ? 'Loading...'
                              : 'Login'),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
