import 'package:flutter/material.dart';
import 'screens/tv_dashboard_screen.dart';
import 'screens/movie_dashboard_screen.dart';
import './screens/movie_details_screen.dart';
import './screens/tv_details_screen.dart';
import './screens/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MovieDashboardScreen(),
      routes: {
        '/movie-details': (ctx) => MovieDetailsScreen(),
        '/movie-dashboard': (ctx) => MovieDashboardScreen(),
        '/tv-details': (ctx) => TvDetailsScreen(),
        '/tv-dashboard': (ctx) => TvDashboardScreen(),
        '/profile': (ctx) => HomeView(),
      },
    );
  }
}
