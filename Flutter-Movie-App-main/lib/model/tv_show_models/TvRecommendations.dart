// To parse this JSON data, do
//
//     final tvRecommendations = tvRecommendationsFromJson(jsonString);

import 'dart:convert';

TvRecommendations tvRecommendationsFromJson(String str) =>
    TvRecommendations.fromJson(json.decode(str));

String tvRecommendationsToJson(TvRecommendations data) =>
    json.encode(data.toJson());

class TvRecommendations {
  TvRecommendations({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory TvRecommendations.fromJson(Map<String, dynamic> json) =>
      TvRecommendations(
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
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.networks,
    this.popularity,
  });

  String backdropPath;
  DateTime firstAirDate;
  List<int> genreIds;
  int id;
  String name;
  List<OriginCountryElement> originCountry;
  OriginalLanguage originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  double voteAverage;
  int voteCount;
  List<Network> networks;
  double popularity;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: List<OriginCountryElement>.from(json["origin_country"]
            .map((x) => originCountryElementValues.map[x])),
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        networks: List<Network>.from(
            json["networks"].map((x) => Network.fromJson(x))),
        popularity: json["popularity"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "first_air_date":
            "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "name": name,
        "origin_country": List<dynamic>.from(
            originCountry.map((x) => originCountryElementValues.reverse[x])),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "networks": List<dynamic>.from(networks.map((x) => x.toJson())),
        "popularity": popularity,
      };
}

class Network {
  Network({
    this.id,
    this.logo,
    this.name,
    this.originCountry,
  });

  int id;
  Logo logo;
  String name;
  NetworkOriginCountry originCountry;

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"],
        logo: Logo.fromJson(json["logo"]),
        name: json["name"],
        originCountry: networkOriginCountryValues.map[json["origin_country"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo.toJson(),
        "name": name,
        "origin_country": networkOriginCountryValues.reverse[originCountry],
      };
}

class Logo {
  Logo({
    this.path,
    this.aspectRatio,
  });

  String path;
  double aspectRatio;

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        path: json["path"],
        aspectRatio: json["aspect_ratio"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "aspect_ratio": aspectRatio,
      };
}

enum NetworkOriginCountry { GB, US, EMPTY }

final networkOriginCountryValues = EnumValues({
  "": NetworkOriginCountry.EMPTY,
  "GB": NetworkOriginCountry.GB,
  "US": NetworkOriginCountry.US
});

enum OriginCountryElement { GB, US, CA }

final originCountryElementValues = EnumValues({
  "CA": OriginCountryElement.CA,
  "GB": OriginCountryElement.GB,
  "US": OriginCountryElement.US
});

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
