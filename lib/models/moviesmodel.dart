import 'dart:convert';

List<MoviesModel> moviesModelsFromJson(String str) => List<MoviesModel>.from(
    json.decode(str).map((x) => MoviesModel.fromJson(x)));
MoviesModel moviesModelFromJson(String str) =>
    MoviesModel.fromJson(json.decode(str));

String moviesModelToJson(MoviesModel data) => json.encode(data.toJson());

class MoviesModel {
  MoviesModel({
    required this.id,
    required this.title,
    required this.description,
    required this.runtime,
  });

  String id;
  String title;
  String description;
  String runtime;

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        runtime: json["runtime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "runtime": runtime,
      };
}
