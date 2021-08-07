// To parse this JSON data, do
//
//     final movieReview = movieReviewFromJson(jsonString);

import 'dart:convert';

MovieReview movieReviewFromJson(String str) =>
    MovieReview.fromJson(json.decode(str));

String movieReviewToJson(MovieReview data) => json.encode(data.toJson());

class MovieReview {
  MovieReview({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int id;
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory MovieReview.fromJson(Map<String, dynamic> json) => MovieReview(
        id: json["id"],
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
    this.author,
    this.content,
    this.id,
    this.url,
  });

  String author;
  String content;
  String id;
  String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        author: json["author"],
        content: json["content"],
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "content": content,
        "id": id,
        "url": url,
      };
}
