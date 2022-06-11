// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResponseModel _$CharactersResponseModelFromJson(
        Map<String, dynamic> json) =>
    CharactersResponseModel(
      code: json['code'] as int?,
      attributionText: json['attributionText'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharactersResponseModelToJson(
        CharactersResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'attributionText': instance.attributionText,
      'data': instance.data?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      offset: json['offset'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'offset': instance.offset,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnail': instance.thumbnail?.toJson(),
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) => Thumbnail(
      path: json['path'] as String?,
      extension: json['extension'] as String?,
    );

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'path': instance.path,
      'extension': instance.extension,
    };
