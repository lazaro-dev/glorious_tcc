import 'package:flutter/material.dart';
import 'package:glorious_tcc/ui/widgets/custom/app_bar_custom/app_bar_custom.dart';
import 'package:glorious_tcc/ui/widgets/custom/expandable_fab/expandable_fab.dart';
import 'package:glorious_tcc/ui/widgets/custom/menu/menu_drawer.dart';

class BankAccountScreen extends StatefulWidget {
  const BankAccountScreen({super.key});

  @override
  State<BankAccountScreen> createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  final List<String> _actionTitles = ['Criar', 'Atualizar', 'Remover'];

  final List<String> bankAccounts = ['Corrente', 'Carteira', 'Poupança'];

  void _showAction(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('FECHAR'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const AppBarCustom(title: 'Contas'),
      backgroundColor: Colors.white,
      body: ListView.separated(
        itemCount: bankAccounts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.balance),
            title: Text(bankAccounts[index]),
            onTap: () {},
          );
        },
      ),
      floatingActionButton: ExpandableFab(
        backgroundButton: Theme.of(context).primaryColor,
        iconColor: Theme.of(context).colorScheme.onSecondary,
        distance: 80,
        children: [
          ActionButton(
            onPressed: () => _showAction(context, 0),
            icon: const Icon(Icons.add),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 1),
            icon: const Icon(Icons.edit),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 2),
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
