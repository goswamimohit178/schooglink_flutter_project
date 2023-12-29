// // To parse this JSON data, do
// //
class DogModel {
  final int? id;
  final String? name;
  final String? bredFor;
  final String? breedGroup;
  final String? lifeSpan;
  final String? temperament;
  final String? countryCode;
  final String? origin;
  final Map<String, dynamic>? weight;
  final Map<String, dynamic>? height;
  final String? referenceImageId;

  DogModel({
    this.id,
    this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.countryCode,
    this.origin,
    this.weight,
    this.height,
    this.referenceImageId,
  });

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      id: json['id'],
      name: json['name'],
      bredFor: json['bred_for'],
      breedGroup: json['breed_group'],
      lifeSpan: json['life_span'],
      temperament: json['temperament'],
      countryCode: json['country_code'],
      origin: json['origin'],
      weight: json['weight'],
      height: json['height'],
      referenceImageId: json['reference_image_id'],
    );
  }
}
