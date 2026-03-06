class Transaction {
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

  Transaction({
    this.id,
    this.description,
    this.value,
    this.date,
    this.status,
    this.financialAreaId,
    this.categoryId,
    this.bankAccountOriginId,
    this.bankAccountDestinationId,
    this.contactId,
    this.accountId,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
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
  }

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
}

enum TransactionStatus { pending, paid, canceled }
