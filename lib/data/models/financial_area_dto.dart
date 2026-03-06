import 'package:glorious_tcc/data/models/contract/model_dto.dart';
import 'package:glorious_tcc/domain/entities/financial_area.dart';

class FinancialAreaDTO extends ModelDTO<FinancialAreaDTO> {
  static const String table = 'financial_areas';

  final int? id;
  final String? name;
  final int? accountId;

  FinancialAreaDTO({
    this.id,
    this.name,
    this.accountId,
  });

  @override
  factory FinancialAreaDTO.fromMap(Map<String, dynamic> map) => FinancialAreaDTO(
        id: map['id'],
        name: map['name'],
        accountId: map['accountId'],
      );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'accountId': accountId,
    };
  }

  @override
  FinancialAreaDTO fromJson(dynamic json) => FinancialAreaDTO(
        id: json['id'] as int?,
        name: json['name'] as String?,
        accountId: json['accountId'] as int?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'accountId': accountId,
      };

  @override
  FinancialArea toDomain() {
    return FinancialArea(
      id: id,
      name: name ?? '',
      accountId: accountId ?? null,
    );
  }

  static FinancialAreaDTO fromDomain(FinancialArea financialArea) {
    return FinancialAreaDTO(
      id: financialArea.id,
      name: financialArea.name,
      accountId: financialArea.accountId,
    );
  }
}
