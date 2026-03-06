class FinancialArea {
  final int? id;
  final String? name;
  final int? accountId;

  FinancialArea({
    this.id,
    this.name,
    this.accountId,
  });

  factory FinancialArea.fromMap(Map<String, dynamic> map) {
    return FinancialArea(
      id: map['id'],
      name: map['name'],
      accountId: map['accountId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'accountId': accountId,
    };
  }
}
