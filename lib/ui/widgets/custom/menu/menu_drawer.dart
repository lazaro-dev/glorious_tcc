import 'package:flutter/material.dart';
import 'package:glorious_tcc/ui/core/routes/app_routes.dart';
import 'package:glorious_tcc/ui/core/viewmodels/auth_view_model.dart';
import 'package:glorious_tcc/ui/widgets/custom/menu/drawer_item.dart';
import 'package:glorious_tcc/ui/widgets/custom/menu/user_drawer_header.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  final String name = 'Carlos';

  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.read<AuthViewModel>();

    return Drawer(
      child: Column(children: [
        UserDrawerHeader(
          name: name,
          urlImage:
              'https://avatars.githubusercontent.com/u/63379716?s=400&u=f809e9401ec8bf4f6d25b841130cad5dfb6505ab&v=4',
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 1,
          ),
          child: Column(
            children: [
              DrawerItem(
                title: 'Principal',
                icon: Icons.home,
                onTap: () => Navigator.pushNamed(context, AppRoutes.home),
              ),
              DrawerItem(
                title: 'Contas',
                icon: Icons.account_balance_wallet,
                onTap: () => Navigator.pushNamed(context, AppRoutes.bankAccount),
              ),
              const Divider(
                color: Colors.deepPurpleAccent,
              ),
              DrawerItem(
                title: 'Sair',
                icon: Icons.exit_to_app,
                onTap: () {
                  authViewModel.logout();
                  Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
