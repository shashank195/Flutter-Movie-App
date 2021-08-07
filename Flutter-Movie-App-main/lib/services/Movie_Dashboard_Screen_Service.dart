import 'dart:async'; // For the Asynchronos Functionsimport 'dart:convert'
import 'package:http/http.dart' as http; // For Handeling HTTP Requests
import '../model/movie_models/PopularList.dart';
import '../model/movie_models/TopRated.dart';
import '../model/movie_models/Upcoming.dart';

class PopularMovies {
  static const String url =
      'https://api.themoviedb.org/3/movie/popular?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=1';

  Future getData() async {
    final response = await http.get(url);
    if (200 == response.statusCode) {
      print('Popular Success');
      final popularList = popularListFromJson(response.body);
      return popularList.results;
    } else {
      return [];
    }
  }
}

class TopMovies {
  static const String url =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=2';

  Future getData() async {
    final response = await http.get(url);
    if (200 == response.statusCode) {
      print('Top Rated Success');
      final topRatedList = topRatedListFromJson(response.body);
      return topRatedList.results;
    } else {
      return [];
    }
  }
}

class UpcomingMovies {
  static const String url =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=1';

  Future getData() async {
    final response = await http.get(url);
    if (200 == response.statusCode) {
      print('Upcoming Success');
      final upcomingMovies = upcomingMoviesFromJson(response.body);
      return upcomingMovies.results;
    } else {
      return [];
    }
  }
}
