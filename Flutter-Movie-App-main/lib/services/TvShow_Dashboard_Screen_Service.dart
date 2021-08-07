import 'dart:async'; // For the Asynchronos Functionsimport 'dart:convert'
import 'package:http/http.dart' as http; // For Handeling HTTP Requests
import '../model/tv_show_models/PopularList.dart';
import '../model/tv_show_models/TopRated.dart';
import '../model/tv_show_models/Upcoming.dart';

class PopularTv {
  static const String url =
      'https://api.themoviedb.org/3/tv/popular?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=1';

  Future getData() async {
    final response = await http.get(url);
    if (200 == response.statusCode) {
      final popularList = popularListFromJson(response.body);
      return popularList.results;
    } else {
      return [];
    }
  }
}

class TopTv {
  static const String url =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=1';

  Future getData() async {
    final response = await http.get(url);
    if (200 == response.statusCode) {
      final topRatedList = topRatedListFromJson(response.body);
      return topRatedList.results;
    } else {
      return [];
    }
  }
}

class UpcomingTv {
  static const String url =
      'https://api.themoviedb.org/3/tv/on_the_air?api_key=c24cd9055ce02f78577b5bd462258bc0&language=en-US&page=1';

  Future getData() async {
    final response = await http.get(url);
    if (200 == response.statusCode) {
      final upcomingTvList = upcomingTvListFromJson(response.body);
      return upcomingTvList.results;
    } else {
      return [];
    }
  }
}
