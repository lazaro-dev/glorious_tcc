import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const AppBarCustom({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title ?? '',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 24,
        ),
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 32, // Changing Drawer Icon Size
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      // actions: [
      //   IconButton(
      //     color: Colors.white,
      //     icon: const Icon(Icons.exit_to_app),
      //     onPressed: () {
      //       loginStore.logout();
      //       Navigator.of(context).pushReplacementNamed('/login');
      //     },
      //   ),
      // ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50);
}
