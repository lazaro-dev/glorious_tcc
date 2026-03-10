import 'package:flutter/material.dart';
// import 'dart:async';

import 'package:glorious_tcc/ui/core/routes/app_routes.dart';
import 'package:glorious_tcc/ui/core/state/view_state.dart';
import 'package:glorious_tcc/ui/core/viewmodels/auth_view_model.dart';

class WelcomeScreen extends StatefulWidget {
  final AuthViewModel viewModel;

  const WelcomeScreen({super.key, required this.viewModel});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VoidCallback _listener;

  @override
  void initState() {
    super.initState();

    widget.viewModel.checkLogin();

    _listener = () {
      final state = widget.viewModel.authState;

      if (state.viewState == ViewState.success) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;

          if (state.state == LoginState.authenticated) {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          } else {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }
        });
      }
    };

    widget.viewModel.authState.addListener(_listener);
  }

  @override
  void dispose() {
    widget.viewModel.authState.removeListener(_listener);
    super.dispose();
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
