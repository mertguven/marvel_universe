// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_comics_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterComicsResponseModel _$CharacterComicsResponseModelFromJson(
        Map<String, dynamic> json) =>
    CharacterComicsResponseModel(
      code: json['code'] as int?,
      attributionText: json['attributionText'] as String?,
      data: json['data'] == null
          ? null
          : ComicsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterComicsResponseModelToJson(
        CharacterComicsResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'attributionText': instance.attributionText,
      'data': instance.data?.toJson(),
    };

ComicsData _$ComicsDataFromJson(Map<String, dynamic> json) => ComicsData(
      limit: json['limit'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ComicsResults.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicsDataToJson(ComicsData instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };

ComicsResults _$ComicsResultsFromJson(Map<String, dynamic> json) =>
    ComicsResults(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] == null
          ? null
          : ComicsThumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicsResultsToJson(ComicsResults instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail?.toJson(),
    };

ComicsThumbnail _$ComicsThumbnailFromJson(Map<String, dynamic> json) =>
    ComicsThumbnail(
      path: json['path'] as String?,
      extension: json['extension'] as String?,
    );

Map<String, dynamic> _$ComicsThumbnailToJson(ComicsThumbnail instance) =>
    <String, dynamic>{
      'path': instance.path,
      'extension': instance.extension,
    };
