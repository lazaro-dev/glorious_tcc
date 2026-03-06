import 'package:glorious_tcc/data/models/contract/model_dto.dart';
import 'package:glorious_tcc/domain/entities/transaction_category.dart';

class TransactionCategoryDTO extends ModelDTO<TransactionCategoryDTO> {
  static const String table = 'transaction_categories';

  final int? id;
  final String? name;
  final int? financialAreaId;
  final int? accountId;

  TransactionCategoryDTO({
    this.id,
    this.name,
    this.financialAreaId,
    this.accountId,
  });

  @override
  factory TransactionCategoryDTO.fromMap(Map<String, dynamic> map) =>
      TransactionCategoryDTO(
        id: map['id'],
        name: map['name'],
        financialAreaId: map['financialAreaId'],
        accountId: map['accountId'],
      );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'financialAreaId': financialAreaId,
      'accountId': accountId,
    };
  }

  @override
  TransactionCategoryDTO fromJson(dynamic json) => TransactionCategoryDTO(
        id: json['id'] as int?,
        name: json['name'] as String?,
        financialAreaId: json['financialAreaId'] as int?,
        accountId: json['accountId'] as int?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'financialAreaId': financialAreaId,
        'accountId': accountId,
      };

  @override
  TransactionCategory toDomain() {
    return TransactionCategory(
      id: id,
      name: name ?? '',
      financialAreaId: financialAreaId,
      accountId: accountId,
    );
  }

  static TransactionCategoryDTO fromDomain(TransactionCategory account) {
    return TransactionCategoryDTO(
      id: account.id,
      name: account.name,
      financialAreaId: account.financialAreaId,
      accountId: account.accountId,
    );
  }
}
