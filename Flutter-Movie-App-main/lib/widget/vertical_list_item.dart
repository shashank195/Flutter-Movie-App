import 'package:flutter/material.dart';
import '../screens/movie_details_screen.dart';
import '../screens/tv_details_screen.dart';

// ignore: must_be_immutable
class VerticalListItem extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final url_header = 'https://image.tmdb.org/t/p/w500';
  final int index;
  final name;
  String url;
  String type;
  List item;
  VerticalListItem(this.index, this.item, this.name, this.type) {
    url = url_header + item[index].posterPath;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: type == 'movie'
              ? () {
                  Navigator.of(context).pushNamed(
                    '/movie-details',
                    arguments: {
                      'id': item[index].id.toString(),
                      'title': name.toString(),
                      'imageUrl': url.toString(),
                      'description': item[index].overview.toString(),
                      'rating': item[index].voteAverage.toString(),
                      'year': '2020',
                      'duration': item[index].voteCount.toString(),
                    },
                  );
                }
              : () {
                  Navigator.of(context).pushNamed(
                    '/tv-details',
                    arguments: {
                      'id': item[index].id.toString(),
                      'title': name.toString(),
                      'imageUrl': url.toString(),
                      'description': item[index].overview.toString(),
                      'rating': item[index].voteAverage.toString(),
                      'year': '2020',
                      'duration': item[index].voteCount.toString(),
                    },
                  );
                },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: DateTime.now().millisecondsSinceEpoch,
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          url,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 240,
                          child: Text(
                            item[index].overview,
                            maxLines: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
