import 'package:flutter/material.dart';
import 'package:glorious_tcc/ui/widgets/custom/app_bar_custom/app_bar_custom.dart';
import 'package:glorious_tcc/ui/widgets/custom/menu/menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // authStore.
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MenuDrawer(),
        // ignore: prefer_const_constructors
        appBar: AppBarCustom(title: ''),
        resizeToAvoidBottomInset: false,
        body: Container(
          color: const Color.fromARGB(255, 245, 241, 241),
          // padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: [
                  // ],
                ),
              ),
              // Expanded(child: Card(child: Padding,))
            ],
          ),
        ),
      ),
    );
  }
}
