import 'package:bloc_demo/Model/user.dart';
import 'package:bloc_demo/Screen/dashboard/screen2.dart';
import 'package:flutter/material.dart';

import '../../Manager/preference_manager/manager_preference.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _preferenceManager = PreferenceManager.instance;
  late User? user;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    user = await _preferenceManager.getUserData();
  }

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
              backgroundImage: NetworkImage(user!.avatar),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text('Name: ${user!.firstName} ${user!.lastName}'),
            Text('Email: ${user!.email}'),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Screen2()));
              },
              child: const Text("Press Me"),
            )
          ],
        ),
      ),
    );
  }
}
