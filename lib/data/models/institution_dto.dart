import 'package:glorious_tcc/data/models/contract/model_dto.dart';
import 'package:glorious_tcc/domain/entities/institution.dart';


class InstitutionDTO extends ModelDTO<InstitutionDTO> {
  static const String table = 'institutions';

  final int? id;
  final String? name;
  final String? image;

  InstitutionDTO({
    this.id,
    this.name,
    this.image,
  });

  @override
  factory InstitutionDTO.fromMap(Map<String, dynamic> map) => InstitutionDTO(
        id: map['id'],
        name: map['name'],
        image: map['image'],
      );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  @override
  InstitutionDTO fromJson(dynamic json) => InstitutionDTO(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };

  @override
  Institution toDomain() {
    return Institution(
      id: id,
      name: name ?? '',
      image: image ?? '',
    );
  }

  static InstitutionDTO fromDomain(Institution institution) {
    return InstitutionDTO(
      id: institution.id,
      name: institution.name,
      image: institution.image,
    );
  }
}
