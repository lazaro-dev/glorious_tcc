abstract class ModelDTO<T> {
  ModelDTO();
  
  Map<String, dynamic> toMap();

  Map<String, dynamic> toJson();

  T fromJson(json);

  toDomain();

  ModelDTO.fromMap(Map<String, dynamic> map);

  static ModelDTO fromDomain(dynamic model) {
    throw UnimplementedError(
        "fromDomain precisa ser implementado pela subclasse.");
  }
}
