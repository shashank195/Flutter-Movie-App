import 'package:flutter/material.dart';
import 'dart:math';

class ReviewCard extends StatelessWidget {
  final review;
  final index;
  ReviewCard(this.review, this.index);

  @override
  Widget build(BuildContext context) {
    Random rnd = new Random();
    int min = 5, max = 10;
    int nums = min + rnd.nextInt(max - min);

    return Card(
      color: Colors.deepPurple,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ExpansionTile(
                title: Row(
                  children: [
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 25,
                          color: Colors.white,
                        ),
                        Text(
                          nums.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 200,
                          child: Text('by~ ' + review[index].author,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 19,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                children: [
                  Container(
                    width: 240,
                    child: Text(review[index].content,
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
