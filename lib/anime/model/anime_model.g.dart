// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
      alternativeTitles: (json['alternativeTitles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      episodes: json['episodes'] as int?,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['_id'] as String?,
      image: json['image'] as String?,
      link: json['link'] as String?,
      ranking: json['ranking'] as int?,
      status: json['status'] as String?,
      synopsis: json['synopsis'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AnimeModelToJson(AnimeModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      '_id': instance.id,
      'alternativeTitles': instance.alternativeTitles,
      'ranking': instance.ranking,
      'genres': instance.genres,
      'episodes': instance.episodes,
      'image': instance.image,
      'link': instance.link,
      'status': instance.status,
      'synopsis': instance.synopsis,
      'type': instance.type,
    };
