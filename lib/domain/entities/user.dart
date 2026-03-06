class User {
  final int? id;
  final String name;
  final String password;
  final String? email;
  final String? phone;
  final String? image;
  final int? accountId;

  User(
      {this.id,
      required this.name,
      required this.password,
      this.email,
      this.phone,
      this.image,
      this.accountId});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      password: map['password'],
      email: map['email'],
      phone: map['phone'],
      image: map['image'],
      accountId: map['accountId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'phone': phone,
      'image': image,
      'accountId': accountId,
    };
  }
  
}
