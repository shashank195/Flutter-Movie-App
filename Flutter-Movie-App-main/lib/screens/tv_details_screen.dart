import 'package:flutter/material.dart';
import '../widget/review_card.dart';
import '../widget/horizontal_list_item.dart';
import '../services/Review_Service.dart';
import '../services/Recommendations_Service.dart';
import 'dart:async';

class TvDetailsScreen extends StatefulWidget {
  static const routeName = '/tv-details';

  @override
  _TvDetailsScreenState createState() => _TvDetailsScreenState();
}

class _TvDetailsScreenState extends State<TvDetailsScreen> {
  // ignore: non_constant_identifier_names
  var review = [];
  var recommendations = [];
  var id;

  Future fetch() async {
    final rev = new TvReview(id);
    review = await rev.getData();
    if (review.length == 0) {
      // print(" Tv Review API Extraction Unsuccessfull");
    } else {
      // print('TV Review API Extraction Succeess');
      setState(() {});
    }

    final rec = new TvRecommendations(id);
    recommendations = await rec.getData();
    if (recommendations.length == 0) {
      // print("Tv Recommendations API Extraction Unsuccessfull");
    } else {
      // print('Tv Recommendations API Extraction Succeess');
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    id = routeArgs['id'];
    final rating = routeArgs['rating'];
    if (review.length == 0) {
      fetch();
    }
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        // title: Text('Movie Details'),
        backgroundColor: Color(0xfff4f4f4),
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: Card(
                elevation: 5,
                child: Hero(
                  tag: DateTime.now().millisecondsSinceEpoch,
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          routeArgs['imageUrl'],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              routeArgs['title'],
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.timer,
                          size: 45,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          routeArgs['duration'],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.calendar_today,
                          size: 45,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          routeArgs['year'],
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          size: 45,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$rating/10',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              routeArgs['description'],
              style: TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            review.length != 0
                // Custom Review Card
                ? ListView.builder(
                    // physics: tells it to prevent the list from being scrollable
                    physics:
                        NeverScrollableScrollPhysics(), // As we already have a Scrollable List hence we dont need to add the scroll feature for this builder again
                    shrinkWrap:
                        true, // Important Property as it tells the List view Builder to only take the space it requires
                    itemCount: review.length,
                    itemBuilder: (context, index) {
                      return ReviewCard(review, index);
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'No Reviews Present',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Recommended',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            recommendations.length != 0
                ? Container(
                    height: 290,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendations.length,
                      itemBuilder: (ctx, i) => HorizontalListItem(
                          i, recommendations, recommendations[i].name, 'tv'),
                    ),
                  )
                : Text(
                    'None',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    Icons.play_circle_outline,
                  ),
                  Text(
                    'Watch Trailer',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: RaisedButton(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              onPressed: () {},
              color: Colors.green,
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.check_circle_outline,
                  ),
                  Container(
                    height: 5,
                    width: 5,
                  ),
                  Text(
                    'Add to Fav',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
