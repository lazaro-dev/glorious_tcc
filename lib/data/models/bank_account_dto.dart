import 'package:glorious_tcc/data/models/contract/model_dto.dart';
import 'package:glorious_tcc/domain/entities/bank_account.dart';

class BankAccountDTO extends ModelDTO<BankAccountDTO> {
  static const String table = 'bank_accounts';

  final int? id;
  final String? name;
  final double? balance;
  final int? institutionId;
  final int? accountId;

  BankAccountDTO({
    this.id,
    this.name,
    this.balance,
    this.institutionId,
    this.accountId,
  });

  @override
  factory BankAccountDTO.fromMap(Map<String, dynamic> map) => BankAccountDTO(
        id: map['id'],
        name: map['name'],
        balance: map['balance'],
        institutionId: map['institutionId'],
        accountId: map['accountId'],
      );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'balance': balance,
      'institutionId': institutionId,
      'accountId': accountId,
    };
  }

  @override
  BankAccountDTO fromJson(dynamic json) => BankAccountDTO(
        id: json['id'] as int?,
        name: json['name'] as String?,
        balance: json['balance'] as double?,
        institutionId: json['institutionId'] as int?,
        accountId: json['accountId'] as int?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'balance': balance,
        'institutionId': institutionId,
        'accountId': accountId,
      };

  @override
  BankAccount toDomain() {
    return BankAccount(
      id: id,
      name: name ?? '',
      balance: balance ?? 0,
      institutionId: institutionId,
      accountId: accountId,
    );
  }

  static BankAccountDTO fromDomain(BankAccount account) {
    return BankAccountDTO(
      id: account.id,
      name: account.name,
      balance: account.balance,
      institutionId: account.institutionId,
      accountId: account.accountId,
    );
  }
}
