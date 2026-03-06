class Contact {
  final int? id;
  final String? name;
  final String? type;
  final int? accountId;

  Contact({
    this.id,
    this.name,
    this.type,
    this.accountId,
  });

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      accountId: map['accountId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'accountId': accountId,
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
