// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'character_comics_request_model.g.dart';

@JsonSerializable()
class CharacterComicsRequestModel {
  int? id;

  CharacterComicsRequestModel({this.id});

  factory CharacterComicsRequestModel.fromJson(Map<String, dynamic> data) =>
      _$CharacterComicsRequestModelFromJson(data);
  Map<String, dynamic> toJson() => _$CharacterComicsRequestModelToJson(this);
}
