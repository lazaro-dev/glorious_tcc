import 'package:flutter/material.dart';
// import 'package:personal_finance_tcc/presenter/pages/account/account_page.dart';
// import 'package:personal_finance_tcc/presenter/pages/auth/login_page.dart';
// import 'package:personal_finance_tcc/presenter/pages/home_page.dart';
// import 'package:personal_finance_tcc/presenter/pages/welcome_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        // '/': (context) => const WelcomePage(),
        // '/login': (context) => const LoginPage(),
        // '/home': (context) => const HomePage(),
        // '/account': (context) => const AccountPage(),
      },
    );
  }
}
