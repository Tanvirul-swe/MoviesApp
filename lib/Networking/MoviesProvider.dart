import 'dart:convert';

import 'package:http/http.dart'as http;

import '../main.dart';

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