class Account {
  final int? id;
  final String? name;
  final String? type;
  final int? institutionId;

  Account({
    this.id,
    this.name,
    this.type,
    this.institutionId,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      institutionId: map['institutionId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'institutionId': institutionId,
    };
  }

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value.toDouble();
    }
  }
}
