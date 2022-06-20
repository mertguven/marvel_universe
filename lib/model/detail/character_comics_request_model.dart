import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'character_comics_request_model.g.dart';

@JsonSerializable()
class CharacterComicsRequestModel extends Equatable {
  final int id;

  const CharacterComicsRequestModel(this.id);

  @override
  List<Object?> get props => [id];

  factory CharacterComicsRequestModel.fromJson(Map<String, dynamic> data) =>
      _$CharacterComicsRequestModelFromJson(data);
  Map<String, dynamic> toJson() => _$CharacterComicsRequestModelToJson(this);
}
