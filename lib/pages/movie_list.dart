

import 'package:flutter/material.dart';
import 'package:katalog_film/helper/http_service.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget{
  @override
  _MovieListState createState() => _MovieListState();
  
  }
  
  class _MovieListState extends State<MovieList> {
    List movies;
    int movieCount;
    HttpService service;

    Future initialize() async {
      movies = [];
      movies = await service.getPopularMovies();
      setState(() {
        movieCount = movies.length;
        movies = movies;
      });
    }

  @override
  void initState(){
    service = HttpService();
    initialize();
    super.initState();
  }
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: (this.movieCount == null) ? 0 : this.movieCount,
        itemBuilder: (context, int position){
          return Card(
            
            color : Colors.white54,
            elevation: 3.0,
            child: ListTile(
              leading: Image.network('https://image.tmdb.org/t/p/w500/' +
                  movies[position].posterPath),
                  
              title:Text(movies[position].title, 
              style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.w600, 
                fontSize: 18,) ,),
              subtitle: Text(
                'Rating = ' + movies[position].voteAverage.toString(), 
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 15,
                  fontStyle: FontStyle.italic)
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
              },
              ),
          );
        })
    );
  }
}