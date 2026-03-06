import 'package:glorious_tcc/data/models/contract/model_dto.dart';
import 'package:glorious_tcc/domain/entities/account.dart';

class AccountDTO extends ModelDTO<AccountDTO> {
  static const String table = 'accounts';

  final int? id;
  final String? name;
  final String? type;
  final DateTime? createdAt;

  AccountDTO({
    this.id,
    this.name,
    this.type,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  @override
  factory AccountDTO.fromMap(Map<String, dynamic> map) => AccountDTO(
        id: map['id'],
        name: map['name'],
        type: map['type'],
        createdAt: map['createdAt'],
      );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'createdAt ': createdAt,
    };
  }

  @override
  AccountDTO fromJson(dynamic json) => AccountDTO(
        id: json['id'] as int?,
        name: json['name'] as String?,
        type: json['type'] as String,
        createdAt: DateTime.parse(json['createdAt']),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'createdAt ': createdAt?.toIso8601String(),
      };

  @override
  Account toDomain() {
    return Account(
      id: id,
      name: name ?? '',
      type: type ?? '',
    );
  }

  static AccountDTO fromDomain(Account account) {
    return AccountDTO(
      id: account.id,
      name: account.name,
      type: account.type,
    );
  }
}
