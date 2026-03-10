import 'package:flutter/material.dart';
import 'package:glorious_tcc/ui/core/state/view_state.dart';
import 'package:glorious_tcc/ui/core/viewmodels/auth_view_model.dart';
import 'package:glorious_tcc/ui/widgets/custom/state_animated_builder/state_animated_builder.dart';

class LoginScreen extends StatefulWidget {
  final AuthViewModel viewModel;

  const LoginScreen({super.key, required this.viewModel});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();

    widget.viewModel.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: StateBuilder(
                  state: widget.viewModel.authState,
                  builder: (context, state) {
                    final stateManager = widget.viewModel.authState;

                    if (stateManager.viewState == ViewState.success &&
                        stateManager.state == LoginState.authenticated) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pushReplacementNamed('/home');
                      });
                    }

                    if (stateManager.viewState == ViewState.failure) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text(stateManager.errorMessage ?? "Erro")),
                        );
                      });
                    }

                    final loading = stateManager.viewState == ViewState.loading;

                    return Column(
                      children: [
                        TextField(
                          controller: usernameController,
                          enabled: !loading,
                          decoration:
                              const InputDecoration(labelText: "Usuário"),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: passwordController,
                          enabled: !loading,
                          obscureText: !passwordVisible,
                          decoration: InputDecoration(
                            labelText: "Senha",
                            suffixIcon: IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: loading
                              ? null
                              : () {
                                  widget.viewModel.login(
                                    usernameController.text,
                                    passwordController.text,
                                  );
                                },
                          child: loading
                              ? const CircularProgressIndicator()
                              : const Text("Entrar"),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
