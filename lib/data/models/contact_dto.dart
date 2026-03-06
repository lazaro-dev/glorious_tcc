import 'package:glorious_tcc/data/models/contract/model_dto.dart';
import 'package:glorious_tcc/domain/entities/contact.dart';

class ContactDTO extends ModelDTO<ContactDTO> {
  static const String table = 'contacts';

  final int? id;
  final String? name;
  final String? type;
  final int? accountId;

  ContactDTO({
    this.id,
    this.name,
    this.type,
    this.accountId,
  });

  @override
  factory ContactDTO.fromMap(Map<String, dynamic> map) => ContactDTO(
        id: map['id'],
        name: map['name'],
        type: map['type'],
        accountId: map['accountId'],
      );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'accountId': accountId,
    };
  }

  @override
  ContactDTO fromJson(dynamic json) => ContactDTO(
        id: json['id'] as int?,
        name: json['name'] as String?,
        type: json['type'] as String,
        accountId: json['accountId'] as int?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'accountId': accountId,
      };

  @override
  Contact toDomain() {
    return Contact(
      id: id,
      name: name ?? '',
      type: type ?? '',
      accountId: accountId,
    );
  }

  static ContactDTO fromDomain(Contact contact) {
    return ContactDTO(
      id: contact.id,
      name: contact.name,
      type: contact.type,
      accountId: contact.accountId,
    );
  }
}
