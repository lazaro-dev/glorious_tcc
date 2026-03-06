class TransactionCategory {
  final int? id;
  final String? name;
  final int? financialAreaId;
  final int? accountId;

  TransactionCategory({
    this.id,
    this.name,
    this.financialAreaId,
    this.accountId,
  });

  factory TransactionCategory.fromMap(Map<String, dynamic> map) {
    return TransactionCategory(
      id: map['id'],
      name: map['name'],
      financialAreaId: map['financialAreaId'],
      accountId: map['accountId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'financialAreaId': financialAreaId,
      'accountId': accountId,
    };
  }
}
