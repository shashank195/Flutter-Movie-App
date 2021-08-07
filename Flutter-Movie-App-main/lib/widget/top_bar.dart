import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/tv-dashboard');
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
