import 'package:flutter/material.dart';
// import 'dart:async';

import 'package:glorious_tcc/data/repositories/auth_repository.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final AuthRepository authRepository = AuthRepository();

  @override
  void initState() {
    super.initState();
    authRepository.isLogged().then((bool value) {
      // if (value) {
      //   Timer(const Duration(seconds: 3), () {
      //     Navigator.pushReplacementNamed(context, '/home');
      //   });
      // } else {
      //   Timer(const Duration(seconds: 3), () {
      //     Navigator.pushReplacementNamed(context, '/login');
      //   });
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Bem vindo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
