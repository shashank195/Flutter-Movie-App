import 'package:flutter/material.dart';
import '../screens/tv_dashboard_screen.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap; // For a Button to do something hence we have added this
  final String route;

  CustomListTile(this.icon, this.text, this.onTap, this.route);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.white,
        ))),
        child: InkWell(
          splashColor: Colors.teal,
          onTap: () {
            Navigator.of(context).pushNamed(
              route,
            );
          },
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
