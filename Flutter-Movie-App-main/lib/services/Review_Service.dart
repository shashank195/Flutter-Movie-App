import 'dart:async'; // For the Asynchronos Functionsimport 'dart:convert'
import 'package:http/http.dart' as http; // For Handeling HTTP Requests
import '../model/movie_models/MovieReview.dart';
import '../model/tv_show_models/TvReview.dart';

class MovieReview {
  String id = '';
  String url = '';

  MovieReview(this.id);

  Future getData() async {
    url =
        'https://api.themoviedb.org/3/movie/$id/reviews?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=1';
    final response = await http.get(url);
    if (200 == response.statusCode) {
      final movieReview = movieReviewFromJson(response.body);
      // print('Movie Review Api service Worked ');
      return movieReview.results;
    } else {
      // print('Movie Review Api service did not work ');
      return [];
    }
  }
}

class TvReview {
  String id = '';
  String url = '';

  TvReview(this.id);

  Future getData() async {
    url =
        'https://api.themoviedb.org/3/tv/$id/reviews?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=1';
    final response = await http.get(url);
    if (200 == response.statusCode) {
      final tvReview = tvReviewFromJson(response.body);
      // print('Tv Review Api service Worked ');
      return tvReview.results;
    } else {
      // print('Tv Review Api service Did not Work ');
      return [];
    }
  }
}
