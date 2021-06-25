import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/main.dart';

class MoviesListing extends StatefulWidget {
  @override
  _MoviesListingState createState() => _MoviesListingState();
}

class _MoviesListingState extends State<MoviesListing> {
  //Variable to hold movies information
  List<MovieModel> movies = <MovieModel>[];
  //Method to fetch movies from network
  fetchMovies() async {
    //Fetching data from sever
    var data = await MoviesProvider.getJson();

    setState(() {
      //Holding data from server in generic list results
      List<dynamic> results = data['results'];

      //Iterating over results list and converting to MovieModel
      results.forEach((element){
        movies.add(MovieModel.fromJson(element));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //Fetch movies
    fetchMovies();

    return Scaffold(
      //SingleChildScrollView to provide scrolling for flexible data rendering
      body: ListView.builder(
          itemCount: movies == null ? 0 : movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(movies[index].title),
            );
          }),
    );
  }
}

class MoviesProvider {
  static final String imagePathPrefix = 'https://image.tmdb.org/t/p/w500/';
  //NOTE: Method to make http requests
  static Future<Map> getJson() async {
    final apiEndPoint =
        "http://api.themoviedb.org/3/discover/movie?api_key=$apiKey&sort_by=popularity.desc";
    //URL to fetch movies information
    final apiResponse = await http.get(Uri.parse(apiEndPoint));
    //'Instance of Response'
    return json.decode(apiResponse.body);
  }
}

class MovieModel {
  //Class fields for mapping to JSON properties
  final int id;
  final num popularity;
  final int vote_count;
  final bool video;
  final String poster_path;
  final String? backdrop_path;
  final bool adult;
  final String original_language;
  final String original_title;
  final List<dynamic> genre_ids;
  final String title;
  final num vote_average;
  final String overview;
  final String? release_date;

  //Takes JSON formatted map, and returns `MovieModel` object.
  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        popularity = json['popularity'],
        vote_count = json['vote_count'],
        video = json['video'],
        poster_path = json['poster_path'],
        adult = json['adult'],
        original_language = json['original_language'],
        original_title = json['original_title'],
        genre_ids = json['genre_ids'],
        title = json['title'],
        vote_average = json['vote_average'],
        overview = json['overview'],
        release_date = json['release_date'],
        backdrop_path = json['backdrop_path'];
}
