import 'package:flutter/material.dart';
import 'package:katalog_film/pages/movie_list.dart';
import 'package:katalog_film/pages/movie_list_playing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => PlayingMovieList(),
        '/popular': (context) => MovieList(),
      },
    );
  }
}





