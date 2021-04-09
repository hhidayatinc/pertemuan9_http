import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:katalog_film/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);
  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("Movie Detail"),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      body: SingleChildScrollView(
        
        padding: EdgeInsets.only(top :30),
        
        child: Center(
          
          child: Column(children: [
            
            Container(
              
              
              width: 250,
              height: height / 1.9,
              child: Image.network(path),
          
              
            ),
            
            Container(
              child: Column(
                children: [
                   Container(
               padding: EdgeInsets.only(right: 20, left: 20, top: 10),
               child: Text(movie.title + " / " + movie.voteAverage.toString(), 
               style: TextStyle(
                 fontSize: 20,fontWeight: FontWeight.w500, color: Colors.white)
                 ),
             ),
             
             Container(
               padding: EdgeInsets.only(left: 30, right: 30, top: 20),
               child: Text(movie.overview, 
               style: TextStyle(
                 fontSize: 16, color: Colors.white)
                 ),
             ),
                  
                ],
            ),)
            
          ],
          ),
            
            
                
          
          
        ),
        
      // Container(
      //           child: Text(movie.overview),
      //           padding: EdgeInsets.only(left: 16, right: 16),
      //         )
    )
    );
  }
}
