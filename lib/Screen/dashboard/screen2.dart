import 'package:flutter/material.dart';

import '../../Manager/preference_manager/manager_preference.dart';
import '../../Model/user.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _preferenceManager = PreferenceManager.instance;
  late  User? user;

  @override
  void initState() {
    getUserData();
    super.initState();
  }
  getUserData() async{
    user=await _preferenceManager.getUserData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body:   Center(
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
          ],
        ),
      ),
    );
  }
}
