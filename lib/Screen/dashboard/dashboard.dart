import 'package:bloc_demo/Model/user.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final User user;

 const DashboardScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text('Name: ${user.firstName} ${user.lastName}'),
            Text('Email: ${user.email}'),
          ],
        ),
      ),
    );
  }
}
