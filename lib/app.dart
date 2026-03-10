import 'package:flutter/material.dart';
import 'package:glorious_tcc/data/repositories/auth_repository.dart';
import 'package:glorious_tcc/data/repositories/user_repository.dart';
import 'package:glorious_tcc/data/services/auth_service.dart';
import 'package:glorious_tcc/data/services/session_service.dart';
import 'package:glorious_tcc/ui/core/routes/app_routes.dart';
import 'package:glorious_tcc/ui/core/viewmodels/auth_view_model.dart';
import 'package:glorious_tcc/ui/screens/auth/login/login_screen.dart';
import 'package:glorious_tcc/ui/screens/bank_account/bank_account_screen.dart';
import 'package:glorious_tcc/ui/screens/home/home_screen.dart';
import 'package:glorious_tcc/ui/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthRepository>(
            create: (_) => AuthRepository(),
          ),
          Provider<UserRepository>(
            create: (_) => UserRepository(),
          ),
          Provider<SessionService>(
            create: (_) => SessionService(),
          ),
          Provider<AuthService>(
            create: (context) => AuthService(
              context.read<UserRepository>(),
              context.read<SessionService>(),
            ),
          ),
          Provider<AuthViewModel>(
            create: (context) => AuthViewModel(
              context.read<AuthService>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: true,
            // primarySwatch: Colors.purple,
            primaryColor: Colors.deepPurpleAccent,
            scaffoldBackgroundColor: Colors.deepPurpleAccent,
            // brightness: Brightness.dark
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.welcome,
          routes: {
            AppRoutes.welcome: (context) => WelcomeScreen(
                  viewModel: context.read<AuthViewModel>(),
                ),
            AppRoutes.login: (context) => LoginScreen(
                  viewModel: context.read<AuthViewModel>(),
                ),
            AppRoutes.home: (context) => const HomeScreen(
                // viewModel: context.read<AuthViewModel>(),
                ),
            AppRoutes.bankAccount: (context) => const BankAccountScreen(),
          },
        ));
  }
}
