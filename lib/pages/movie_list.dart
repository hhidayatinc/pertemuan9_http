

import 'package:flutter/material.dart';
import 'package:katalog_film/helper/http_service.dart';
import 'package:katalog_film/pages/main_drawer.dart';

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
  //  /backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Popular Movies"),
      ),
      body: GridView.builder(
       padding: EdgeInsets.all(10),
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           mainAxisSpacing: 10.0,
           crossAxisSpacing: 10.0,
           //childAspectRatio: 2.0
           ),
        itemCount: (this.movieCount == null) ? 0 : this.movieCount,
        itemBuilder: (context, int position){
          return GridTile(
           
            child: InkWell(
              child: Image.network('https://image.tmdb.org/t/p/w500/' +
                  movies[position].posterPath,fit: BoxFit.fill,),
                  
                onTap: (){
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movies[position]));
                    Navigator.push(context, route);
                },  
            ),
            
                  
          );
          
        }),
        drawer: MainDrawer(),
    );
  }
}