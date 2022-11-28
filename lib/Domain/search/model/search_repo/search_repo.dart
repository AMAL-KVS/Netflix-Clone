import 'package:json_annotation/json_annotation.dart';
import 'package:netflix/core/strings.dart';

part 'search_repo.g.dart';

@JsonSerializable()
class SearchRepo {
  @JsonKey(name: 'results')
  List<SearchResultData> results;

  SearchRepo({
    this.results = const [],
  });

  factory SearchRepo.fromJson(Map<String, dynamic> json) {
    return _$SearchRepoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRepoToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  String get posterImageUrl => '$imageAppendurl$posterPath';

  SearchResultData({
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
