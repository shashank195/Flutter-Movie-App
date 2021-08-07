import 'dart:async'; // For the Asynchronos Functionsimport 'dart:convert'
import 'package:http/http.dart' as http; // For Handeling HTTP Requests
import '../model/movie_models/MovieSearch.dart'; // Model Class for Movie Search
import '../model/tv_show_models/TvSearch.dart'; // Model Class for Tv Search

class SearchMovie {
  String str = '';
  String url = '';

  SearchMovie(this.str);

  Future getData() async {
    url =
        'https://api.themoviedb.org/3/search/movie?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&query=$str&page=1&include_adult=false';
    final response = await http.get(url);
    if (200 == response.statusCode) {
      final movieSearch = movieSearchFromJson(response.body);
      // print('Movie Search Api service Worked ');
      return movieSearch.results;
    } else {
      // print('Movie Search Api service Did not work ');
      return [];
    }
  }
}

class SearchTv {
  String str = '';
  String url = '';

  SearchTv(this.str);

  Future getData() async {
    url =
        'https://api.themoviedb.org/3/search/tv?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=1&query=$str&include_adult=false';
    final response = await http.get(url);
    if (200 == response.statusCode) {
      final tvSearch = tvSearchFromJson(response.body);
      // print('Tv Search Api service Worked ');
      return tvSearch.results;
    } else {
      // print('Tv Search Api service Did not work ');
      return [];
    }
  }
}
