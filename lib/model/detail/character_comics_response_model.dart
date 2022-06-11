// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'character_comics_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterComicsResponseModel {
  int? code;
  String? attributionText;
  ComicsData? data;

  CharacterComicsResponseModel({this.code, this.attributionText, this.data});

  factory CharacterComicsResponseModel.fromJson(Map<String, dynamic> data) =>
      _$CharacterComicsResponseModelFromJson(data);
  Map<String, dynamic> toJson() => _$CharacterComicsResponseModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComicsData {
  int? limit;
  List<ComicsResults>? results;

  ComicsData({this.limit, this.results});

  factory ComicsData.fromJson(Map<String, dynamic> data) =>
      _$ComicsDataFromJson(data);
  Map<String, dynamic> toJson() => _$ComicsDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ComicsResults {
  int? id;
  String? title;
  String? description;
  ComicsThumbnail? thumbnail;

  ComicsResults({this.id, this.title, this.description, this.thumbnail});

  factory ComicsResults.fromJson(Map<String, dynamic> data) =>
      _$ComicsResultsFromJson(data);
  Map<String, dynamic> toJson() => _$ComicsResultsToJson(this);
}

@JsonSerializable()
class ComicsThumbnail {
  String? path;
  String? extension;

  ComicsThumbnail({this.path, this.extension});

  factory ComicsThumbnail.fromJson(Map<String, dynamic> data) =>
      _$ComicsThumbnailFromJson(data);
  Map<String, dynamic> toJson() => _$ComicsThumbnailToJson(this);
}
