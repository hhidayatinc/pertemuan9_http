import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 50), 
          children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.collections_bookmark, color: Colors.white),
          backgroundColor: Colors.yellow[800]),
        title: Text("MovieU!"),
        subtitle: Text("Upgrade Your Favourite Movies!"),
      ),
      ListTile(
          leading: Icon(Icons.home),
          title: Text("Top Rated Movies"),
          onTap: () {
            Navigator.pushNamed(context, '/');
          }),
      ListTile(
        leading: Icon(Icons.category),
        title: Text("Popular Movies"),
        onTap: () {
          Navigator.pushNamed(context, '/popular');
        },
      ),
    ]));
  }
}