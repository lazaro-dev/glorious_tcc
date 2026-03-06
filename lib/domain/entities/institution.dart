class Institution {
  final int? id;
  final String? name;
  final String? image;

  Institution({
    this.id,
    this.name,
    this.image,
  });

  factory Institution.fromMap(Map<String, dynamic> map) {
    return Institution(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
