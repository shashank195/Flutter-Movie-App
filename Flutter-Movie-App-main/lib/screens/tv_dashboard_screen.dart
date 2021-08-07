import 'package:flutter/material.dart';
import 'dart:async';
import '../widget/side_bar.dart';
import '../services/TvShow_Dashboard_Screen_Service.dart';
import '../services/Search_Service.dart';
import '../widget/horizontal_list_item.dart';
import '../widget/vertical_list_item.dart';

class TvDashboardScreen extends StatefulWidget {
  static const routeName = '/tv-dashboard';
  @override
  _TvDashboardScreenState createState() => _TvDashboardScreenState();
}

class _TvDashboardScreenState extends State<TvDashboardScreen> {
  // ignore: must_call_super
  void initState() {
    fetch();
  }

  final up = new UpcomingTv();

  var upcoming = [];

  var top = new TopTv();

  var toptv = [];

  var pop = new PopularTv();

  var popular = [];

  Future fetch() async {
    upcoming = await up.getData();
    // print(upcoming[0].name);

    // if (upcoming.length == 0) {
    //   print("Upcoming TV Show API Extraction Unsuccessfull");
    // } else {
    //   print(' Ongoing TV Show API Extraction Succeess');
    // }

    toptv = await top.getData();
    // print(toptv[0].name);

    // if (toptv.length == 0) {
    //   print("Top TV Show API Extraction Unsuccessfull");
    // } else {
    //   print(' Top TV Show Movie API Extraction Succeess');
    // }

    popular = await pop.getData();
    // print(popular[0].name);

    // if (popular.length == 0) {
    //   print("Popular TV Show API Extraction Unsuccessfull");
    // } else {
    //   print(' Popular TV Show API Extraction Succeess');
    // }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'Pop-Corn fLiX',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: TvSearch(),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://www.itl.cat/pngfile/big/242-2428811_photo-wallpaper-lights-light-street-night-city-night.jpg"),
                  ),
                ),
                child: Container(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
              CustomListTile(Icons.person, 'Profile', () => {}, '/profile'),
              CustomListTile(Icons.tv, 'TV Shows', () => {}, '/tv-dashboard'),
              CustomListTile(Icons.theaters_outlined, 'Movies', () => {},
                  '/movie-dashboard'),
              CustomListTile(Icons.bookmark_border, 'My List ', () => {},
                  '/movie-dashboard'),
              CustomListTile(
                  Icons.logout, 'Log Out ', () => {}, '/movie-dashboard'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Ongoing Shows',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FlatButton(
                      child: Text('View All'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcoming.length,
                  itemBuilder: (ctx, i) =>
                      HorizontalListItem(i, upcoming, upcoming[i].name, 'tv'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Best of 2020',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FlatButton(
                      child: Text('View All'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                height: 1000,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: popular.length,
                  itemBuilder: (ctx, i) =>
                      VerticalListItem(i, popular, popular[i].name, 'tv'),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Top Rated Shows',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FlatButton(
                      child: Text('View All'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: toptv.length,
                  itemBuilder: (ctx, i) =>
                      HorizontalListItem(i, toptv, toptv[i].name, 'tv'),
                ),
              ),
            ],
          ),
        ));
  }
}

class TvSearch extends SearchDelegate<String> {
  var searchresults = [];

  Future fetchMovie(query) async {
    final sr = new SearchTv(query.toString());
    searchresults = await sr.getData();
    return searchresults;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // return Container(
    //   child: Text(query.toString()),
    // );

    return FutureBuilder(
      future: fetchMovie(query),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1000,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (ctx, i) => VerticalListItem(
                          i, snapshot.data, snapshot.data[i].name, 'tv'),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
