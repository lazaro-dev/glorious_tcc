import 'package:glorious_tcc/data/models/contact_dto.dart';
import 'package:glorious_tcc/data/services/db_service.dart';
import 'package:glorious_tcc/domain/entities/contact.dart';

class ContactRepository {
  final DbService _db;

  ContactRepository(this._db);

  Future<List<Contact>> findAll(int accountId) async {
    final result = await _db.select<ContactDTO>(
      ContactDTO.table,
      // (map) => ContactDTO().fromJson(map),
      where: 'account_id = ?',
      whereArgs: [accountId],
      orderBy: 'name ASC',
    );

    return result.map((e) => e.toDomain()).toList();
  }

  Future<List<Contact>> search(int accountId, String query) async {
    final result = await _db.select<ContactDTO>(
      ContactDTO.table,
      // (map) => ContactDTO().fromJson(map),
      where: 'account_id = ? AND name LIKE ?',
      whereArgs: [accountId, '%$query%'],
      orderBy: 'name ASC',
    );

    return result.map((e) => e.toDomain()).toList();
  }

  Future<void> create(Contact contact) async {
    await _db.insert(
      ContactDTO.table,
      ContactDTO.fromDomain(contact),
    );
  }

  Future<void> update(Contact contact) async {
    await _db.update(
      ContactDTO.table,
      ContactDTO.fromDomain(contact),
      'id = ?',
      [contact.id],
    );
  }

  Future<void> delete(int id) async {
    await _db.delete(
      ContactDTO.table,
      'id = ?',
      [id],
    );
  }
}
