import 'dart:convert';

import 'package:http/http.dart'as http;

import '../main.dart';

class MoviesProvider {
  static final String imagePathPrefix = 'https://image.tmdb.org/t/p/w500/';

  //NOTE: Method to make http requests
  static Future<Map> PopulerGetJson() async {
    final apiEndPoint =
        "http://api.themoviedb.org/3/discover/movie?api_key=$apiKey&sort_by=popularity.desc";
    //URL to fetch movies information
    final apiResponse = await http.get(Uri.parse(apiEndPoint));
    //'Instance of Response'
    return json.decode(apiResponse.body);
  }
  static Future<Map> TopRategetJson() async {
    final apiEndPoint =
        "http://api.themoviedb.org/3/discover/movie?api_key=$apiKey&certification_country=US&certification=R&sort_by=vote_average.desc";
    //URL to fetch movies information
    final apiResponse = await http.get(Uri.parse(apiEndPoint));
    //'Instance of Response'
    return json.decode(apiResponse.body);
  }
  static Future<Map> ScienceFictiongetJson() async {
    final apiEndPoint =
        "http://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=878&with_cast=500&sort_by=vote_average.desc";
    //URL to fetch movies information
    final apiResponse = await http.get(Uri.parse(apiEndPoint));
    //'Instance of Response'
    return json.decode(apiResponse.body);
  }
  static Future<Map> ComedygetJson() async {
    final apiEndPoint =
        "http://api.themoviedb.org/3/discover/movie?api_key=$apiKey&with_genres=35&with_cast=23659&sort_by=revenue.desc";
    //URL to fetch movies information
    final apiResponse = await http.get(Uri.parse(apiEndPoint));
    //'Instance of Response'
    return json.decode(apiResponse.body);
  }
  static Future<Map> Newmovies2021getJson() async {
    final apiEndPoint =
        "http://api.themoviedb.org/3/discover/movie?api_key=$apiKey&primary_release_year=2021&sort_by=vote_average.desc";
    //URL to fetch movies information
    final apiResponse = await http.get(Uri.parse(apiEndPoint));
    //'Instance of Response'
    return json.decode(apiResponse.body);
  }
}