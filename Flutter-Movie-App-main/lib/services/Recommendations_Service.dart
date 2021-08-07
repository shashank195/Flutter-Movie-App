import 'dart:async'; // For the Asynchronos Functionsimport 'dart:convert'
import 'package:http/http.dart' as http; // For Handeling HTTP Requests
import '../model/movie_models/MovieRecommendation.dart';
import '../model/tv_show_models/TvRecommendations.dart';

class MovieRecommendations {
  String id = '';
  String url = '';

  MovieRecommendations(this.id);

  Future getData() async {
    url =
        'https://api.themoviedb.org/3/movie/$id/recommendations?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=1';
    final response = await http.get(url);
    if (200 == response.statusCode) {
      final movieRecommendations = movieRecommendationsFromJson(response.body);
      return movieRecommendations.results;
    } else {
      // print('Movie Recommendation Api service worked ');
      return [];
    }
  }
}

class TvRecommendations {
  String id = '';
  String url = '';

  TvRecommendations(this.id);

  Future getData() async {
    url =
        'https://api.themoviedb.org/3/tv/$id/recommendations?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=1';
    final response = await http.get(url);
    if (200 == response.statusCode) {
      final tvRecommendations = tvRecommendationsFromJson(response.body);
      return tvRecommendations.results;
    } else {
      // print('TV Recommendation Api service did not Work ');
      return [];
    }
  }
}
