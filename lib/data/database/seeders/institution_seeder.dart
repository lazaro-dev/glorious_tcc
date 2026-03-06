import 'package:glorious_tcc/data/models/institution_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';

class InstitutionSeeder {
  static Future<void> execute() async {
    final DbService dbService = DbService.instance;

    final List<InstitutionDTO> institutions = [
      InstitutionDTO(
          name: 'Nubank', image: 'images/institutions/nubank-logo.png'),
      InstitutionDTO(
          name: 'Inter', image: 'images/institutions/banco-inter-logo.png'),
      InstitutionDTO(
          name: 'Bradesco', image: 'images/institutions/bradesco-logo.png'),
      InstitutionDTO(
          name: 'Banco do Brasil',
          image: 'images/institutions/banco-do-brasil-logo.png'),
    ];

    List<Future<dynamic>> funcs = [];
    for (var institution in institutions) {
      funcs.add(dbService.insert(InstitutionDTO.table, institution));
    }

    await Future.wait(funcs);
  }

  static Future<void> reset() async {
    final DbService dbService = DbService.instance;

    await dbService.execute('DELETE FROM ${InstitutionDTO.table}');
  }
}
