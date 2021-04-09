

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
   
      appBar: AppBar(title: Text("Popular Movies"),
      ),
      body: ListView.builder(
        itemCount: (this.movieCount == null) ? 0 : this.movieCount,
        itemBuilder: (context, int position){
          return Card(
            
            color : Colors.white,
            elevation: 3.0,
            child: ListTile(
              leading: Image.network('https://image.tmdb.org/t/p/w500/' +
                  movies[position].posterPath),
                  
              title:Text(movies[position].title, 
              style: TextStyle(
                fontWeight: FontWeight.w500, 
                fontSize: 18,) ,),
              subtitle: Text(
                'Ratings = ' + movies[position].voteAverage.toString(), 
                style: TextStyle(
                  fontSize: 16,
                  )
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