import 'package:flutter/material.dart';
import 'package:glorious_tcc/data/repositories/auth_repository.dart';
import 'package:glorious_tcc/data/services/auth_service.dart';
import 'package:glorious_tcc/ui/core/viewmodels/auth_view_model.dart';
import 'package:glorious_tcc/ui/core/widgets/welcome_screen.dart';
import 'package:provider/provider.dart';
// import 'package:personal_finance_tcc/presenter/pages/account/account_page.dart';
// import 'package:personal_finance_tcc/presenter/pages/auth/login_page.dart';
// import 'package:personal_finance_tcc/presenter/pages/home_page.dart';
// import 'package:personal_finance_tcc/presenter/pages/welcome_page.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthRepository>(
            create: (_) => AuthRepository(),
          ),
          Provider<AuthService>(
            create: (context) => AuthService(
              context.read<AuthRepository>(),
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
          initialRoute: '/',
          routes: {
            '/': (context) => const WelcomeScreen(),
            // '/login': (context) => const LoginPage(),
            // '/home': (context) => const HomePage(),
            // '/account': (context) => const AccountPage(),
          },
        ));
  }
}
