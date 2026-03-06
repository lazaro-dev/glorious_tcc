import 'package:glorious_tcc/data/models/contract/model_dto.dart';
import 'package:glorious_tcc/domain/entities/transaction.dart';

class TransactionDTO extends ModelDTO<TransactionDTO> {
  static const String table = 'transactions';

  final int? id;
  final String? description;
  final double? value;
  final DateTime? date;
  final String? status;
  final int? financialAreaId;
  final int? categoryId;
  final int? bankAccountOriginId;
  final int? bankAccountDestinationId;
  final int? contactId;
  final int? accountId;

  TransactionDTO({
    this.id,
    this.description,
    this.value,
    DateTime? date,
    this.status,
    this.financialAreaId,
    this.categoryId,
    this.bankAccountOriginId,
    this.bankAccountDestinationId,
    this.contactId,
    this.accountId,
  }) : date = date ?? DateTime.now();

  @override
  factory TransactionDTO.fromMap(Map<String, dynamic> map) => TransactionDTO(
        id: map['id'],
        description: map['description'],
        value: map['value'],
        date: map['date'],
        status: map['status'],
        financialAreaId: map['financialAreaId'],
        categoryId: map['categoryId'],
        bankAccountOriginId: map['bankAccountOriginId'],
        bankAccountDestinationId: map['bankAccountDestinationId'],
        contactId: map['contactId'],
        accountId: map['accountId'],
      );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'value': value,
      'date': date,
      'status': status,
      'financialAreaId': financialAreaId,
      'categoryId': categoryId,
      'bankAccountOriginId': bankAccountOriginId,
      'bankAccountDestinationId': bankAccountDestinationId,
      'contactId': contactId,
      'accountId': accountId,
    };
  }

  @override
  TransactionDTO fromJson(dynamic json) => TransactionDTO(
        id: json['id'] as int?,
        description: json['description'] as String?,
        value: json['value'] as double?,
        date: DateTime.parse(json['date']),
        status: json['status'] as String?,
        financialAreaId: json['financialAreaId'] as int?,
        categoryId: json['categoryId'] as int?,
        bankAccountOriginId: json['bankAccountOriginId'] as int?,
        bankAccountDestinationId: json['bankAccountDestinationId'] as int?,
        contactId: json['contactId'] as int?,
        accountId: json['accountId'] as int?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'value': value,
        'date': date?.toIso8601String(),
        'status': status,
        'financialAreaId': financialAreaId,
        'categoryId': categoryId,
        'bankAccountOriginId': bankAccountOriginId,
        'bankAccountDestinationId': bankAccountDestinationId,
        'contactId': contactId,
        'accountId': accountId,
      };

  @override
  Transaction toDomain() {
    return Transaction(
      id: id,
      description: description ?? '',
      value: value ?? 0.0,
      date: date ?? DateTime.now(),
      status: status ?? '',
      financialAreaId: financialAreaId,
      categoryId: categoryId,
      bankAccountOriginId: bankAccountOriginId,
      bankAccountDestinationId: bankAccountDestinationId,
      contactId: contactId,
      accountId: accountId,
    );
  }

  static TransactionDTO fromDomain(Transaction transaction) {
    return TransactionDTO(
      id: transaction.id,
      description: transaction.description,
      value: transaction.value,
      date: transaction.date,
      status: transaction.status,
      financialAreaId: transaction.financialAreaId,
      categoryId: transaction.categoryId,
      bankAccountOriginId: transaction.bankAccountOriginId,
      bankAccountDestinationId: transaction.bankAccountDestinationId,
      contactId: transaction.contactId,
      accountId: transaction.accountId,
    );
  }
}
