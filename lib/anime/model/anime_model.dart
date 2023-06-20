import 'package:json_annotation/json_annotation.dart';
part 'anime_model.g.dart';

@JsonSerializable()
class AnimeModel {
  String? title;

  @JsonKey(name: '_id')
  String? id;
  List<String>? alternativeTitles;
  int? ranking;
  List<String>? genres;
  int? episodes;
  String? image;
  String? link;
  String? status;
  String? synopsis;
  String? type;

  AnimeModel(
      {this.alternativeTitles,
      this.episodes,
      this.genres,
      this.id,
      this.image,
      this.link,
      this.ranking,
      this.status,
      this.synopsis,
      this.title,
      this.type});

  /// Connect the generated [_$AnimeModelFromJson] function to the `fromJson`
  /// factory.
  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);

  /// Connect the generated [_$AnimeModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);
}
