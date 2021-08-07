// To parse this JSON data, do
//
//     final movieRecommendations = movieRecommendationsFromJson(jsonString);

import 'dart:convert';

MovieRecommendations movieRecommendationsFromJson(String str) =>
    MovieRecommendations.fromJson(json.decode(str));

String movieRecommendationsToJson(MovieRecommendations data) =>
    json.encode(data.toJson());

class MovieRecommendations {
  MovieRecommendations({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory MovieRecommendations.fromJson(Map<String, dynamic> json) =>
      MovieRecommendations(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.overview,
    this.releaseDate,
    this.adult,
    this.backdropPath,
    this.voteCount,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.title,
    this.video,
    this.voteAverage,
    this.popularity,
  });

  String overview;
  DateTime releaseDate;
  bool adult;
  String backdropPath;
  int voteCount;
  List<int> genreIds;
  int id;
  OriginalLanguage originalLanguage;
  String originalTitle;
  String posterPath;
  String title;
  bool video;
  double voteAverage;
  double popularity;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        voteCount: json["vote_count"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        posterPath: json["poster_path"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        popularity: json["popularity"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "overview": overview,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "adult": adult,
        "backdrop_path": backdropPath,
        "vote_count": voteCount,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "poster_path": posterPath,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "popularity": popularity,
      };
}

enum OriginalLanguage { EN }

final originalLanguageValues = EnumValues({"en": OriginalLanguage.EN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
