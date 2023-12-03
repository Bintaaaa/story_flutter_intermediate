class StoryResponseModel {
  final String? id;
  final String? name;
  final String? description;
  final String? photoUrl;
  final String? createdAt;
  final double? lat;
  final double? lon;

  StoryResponseModel({
    this.id,
    this.name,
    this.description,
    this.photoUrl,
    this.createdAt,
    this.lat,
    this.lon,
  });

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) => StoryResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        photoUrl: json["photoUrl"],
        createdAt: json["createdAt"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );
}
