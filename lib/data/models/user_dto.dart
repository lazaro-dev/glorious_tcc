import 'package:glorious_tcc/data/models/contract/model_dto.dart';
import 'package:glorious_tcc/domain/entities/user.dart';

class UserDTO extends ModelDTO<UserDTO> {
  static const String table = 'users';
  final int? id;
  final String? name;
  final String? password;
  final String? email;
  final int? accountId;

  UserDTO(
      {this.name,
      this.password,
      this.email,
      this.id,
      this.accountId});

  @override
  factory UserDTO.fromMap(Map<String, dynamic> map) => UserDTO(
        id: map['id'],
        name: map['name'],
        password: map['password'],
        email: map['email'],
        accountId: map['accountId'],
      );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'email': email,
      'accountId': accountId,
    };
  }

  @override
  UserDTO fromJson(dynamic json) => UserDTO(
        id: json['id'] as int?,
        name: json['name'] as String?,
        password: json['password'] as String?,
        email: json['email'] as String?,
        accountId: json['accountId'] as int?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'password': password,
        'email': email,
        'accountId': accountId,
      };

  @override
  User toDomain() {
    return User(
      id: id,
      name: name ?? '',
      password: password ?? '',
      email: email ?? '',
      accountId: accountId ?? null,
    );
  }

  static UserDTO fromDomain(User user) {
    return UserDTO(
      id: user.id,
      name: user.name,
      password: user.password,
      email: user.email,
      accountId: user.accountId,
    );
  }
}
