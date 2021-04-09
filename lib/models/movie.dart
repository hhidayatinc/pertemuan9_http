class Movie{
  int id;
  String title;
  double voteAverage;
  String overview;
  String posterPath;
  String releaseDate;

  Movie(this.id, this.title, this.releaseDate, this.voteAverage, this.overview, this.posterPath);

  Movie.fromJson(Map<String, dynamic> parsedJson){
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.releaseDate = parsedJson['release_date'];
    this.voteAverage = parsedJson['vote_average'] * 1.0;
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
  }
}