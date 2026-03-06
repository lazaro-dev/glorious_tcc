import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glorious_tcc/app.dart';
import 'package:glorious_tcc/data/database/seeders/main_seeder.dart';
import 'package:glorious_tcc/data/models/account_dto.dart';
import 'package:glorious_tcc/data/models/bank_account_dto.dart';
import 'package:glorious_tcc/data/models/contact_dto.dart';
import 'package:glorious_tcc/data/models/financial_area_dto.dart';
import 'package:glorious_tcc/data/models/institution_dto.dart';
import 'package:glorious_tcc/data/models/transaction_category_dto.dart';
import 'package:glorious_tcc/data/models/transaction_dto.dart';
import 'package:glorious_tcc/data/models/user_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';
import 'package:glorious_tcc/ui/core/database/model_registry.dart';

void main() async {
  runApp(const App());

  WidgetsFlutterBinding.ensureInitialized();

  register();

  await MainSeeder.execute(false);
  var db = DbService.instance;

  var result = await db.select<UserDTO>(UserDTO.table);

  // print(result.toString());

  for (var user in result) {
    print(user.toJson());
  }
}

void register() {
  ModelRegistry.register<AccountDTO>((json) => AccountDTO.fromMap(json));
  ModelRegistry.register<BankAccountDTO>(
      (json) => BankAccountDTO.fromMap(json));
  ModelRegistry.register<FinancialAreaDTO>(
      (json) => FinancialAreaDTO.fromMap(json));
  ModelRegistry.register<InstitutionDTO>(
      (json) => InstitutionDTO.fromMap(json));
  ModelRegistry.register<TransactionCategoryDTO>(
      (json) => TransactionCategoryDTO.fromMap(json));
  ModelRegistry.register<UserDTO>((json) => UserDTO.fromMap(json));
  ModelRegistry.register<ContactDTO>((json) => ContactDTO.fromMap(json));
  ModelRegistry.register<TransactionDTO>(
      (json) => TransactionDTO.fromMap(json));
}

// main.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'ui/core/themes/app_theme.dart';
// import 'routing/app_router.dart';
// import 'ui/auth/view_model/auth_view_model.dart';
// import 'ui/home/view_model/home_view_model.dart';
// import 'ui/core/state/state_manager.dart';

// // ui/home/view_model/home_view_model.dart
// import '../../data/repositories/item_repository.dart';
// import '../../domain/models/item.dart';
// import '../../core/state/base_state.dart';

// class HomeViewModel extends BaseState {
//   final ItemRepository _itemRepository = ItemRepository();
//   List<Item> _items = [];

//   List<Item> get items => _items;

//   Future<void> loadItems() async {
//     updateState(loading: true);
//     try {
//       _items = await _itemRepository.getAllItems();
//     } catch (e) {
//       updateState(error: e.toString());
//     } finally {
//       updateState(loading: false);
//     }
//   }

//   Future<void> addItem() async {
//     updateState(loading: true);
//     try {
//       await _itemRepository.addItem('Item ${_items.length + 1}');
//       await loadItems();
//     } catch (e) {
//       updateState(error: e.toString());
//     } finally {
//       updateState(loading: false);
//     }
//   }
// }

// // ui/auth/widgets/login_screen.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../view_model/auth_view_model.dart';

// class LoginScreen extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final authViewModel = context.watch<AuthViewModel>();

//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             if (authViewModel.isLoading) CircularProgressIndicator(),
//             if (authViewModel.errorMessage != null) Text(authViewModel.errorMessage!, style: TextStyle(color: Colors.red)),
//             TextField(controller: _usernameController, decoration: InputDecoration(labelText: 'Username')),
//             TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: authViewModel.isLoading ? null : () {
//                 authViewModel.login(
//                   _usernameController.text,
//                   _passwordController.text,
//                 ).then((_) {
//                   if (authViewModel.isAuthenticated) {
//                     Navigator.pushReplacementNamed(context, '/home');
//                   }
//                 });
//               },
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ui/home/widgets/home_screen.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../view_model/home_view_model.dart';
// import '../../auth/view_model/auth_view_model.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final homeViewModel = context.watch<HomeViewModel>();
//     final authViewModel = context.watch<AuthViewModel>();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: authViewModel.logout,
//           ),
//         ],
//       ),
//       body: homeViewModel.isLoading
//           ? Center(child: CircularProgressIndicator())
//           : homeViewModel.errorMessage != null
//               ? Center(child: Text(homeViewModel.errorMessage!, style: TextStyle(color: Colors.red)))
//               : ListView.builder(
//                   itemCount: homeViewModel.items.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(homeViewModel.items[index].name),
//                     );
//                   },
//                 ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: homeViewModel.isLoading ? null : homeViewModel.addItem,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
