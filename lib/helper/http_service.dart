import 'dart:convert';
import 'package:katalog_film/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HttpService{
  final String apiKey = '11cc63718ff0d986291737254b4c8861';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=';

  Future<List> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if(result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}