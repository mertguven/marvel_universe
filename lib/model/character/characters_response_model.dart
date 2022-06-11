// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'characters_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharactersResponseModel {
  int? code;
  String? attributionText;
  Data? data;

  CharactersResponseModel({this.code, this.attributionText, this.data});

  factory CharactersResponseModel.fromJson(Map<String, dynamic> data) =>
      _$CharactersResponseModelFromJson(data);
  Map<String, dynamic> toJson() => _$CharactersResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  int? offset;
  List<Results>? results;

  Data({this.offset, this.results});

  factory Data.fromJson(Map<String, dynamic> data) => _$DataFromJson(data);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Results {
  int? id;
  String? name;
  String? description;
  Thumbnail? thumbnail;

  Results({this.id, this.name, this.description, this.thumbnail});

  factory Results.fromJson(Map<String, dynamic> data) =>
      _$ResultsFromJson(data);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  factory Thumbnail.fromJson(Map<String, dynamic> data) =>
      _$ThumbnailFromJson(data);
  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}
