class BankAccount {
  final int? id;
  final String? name;
  final double? balance;
  final int? institutionId;
  final int? accountId;

  BankAccount({
    this.id,
    this.name,
    this.balance,
    this.institutionId,
    this.accountId,
  });

  factory BankAccount.fromMap(Map<String, dynamic> map) {
    return BankAccount(
      id: map['id'],
      name: map['name'],
      balance: map['balance'],
      institutionId: map['institutionId'],
      accountId: map['accountId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'balance': balance,
      'institutionId': institutionId,
      'accountId': accountId,
    };
  }
}
