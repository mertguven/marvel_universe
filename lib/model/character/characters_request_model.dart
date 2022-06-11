// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'characters_request_model.g.dart';

@JsonSerializable()
class CharactersRequestModel {
  int? offset;

  CharactersRequestModel({this.offset});

  factory CharactersRequestModel.fromJson(Map<String, dynamic> data) =>
      _$CharactersRequestModelFromJson(data);
  Map<String, dynamic> toJson() => _$CharactersRequestModelToJson(this);
}
