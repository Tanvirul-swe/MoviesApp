
import 'package:flutter/material.dart';
import 'package:restapi/moviesList.dart';



void main() => runApp(MoviesApp());

//REPLACE: Replace YOUR_API_KEY with your API key
final apiKey = "d35cb2cc5a7b666b8ac606fb831c6e66";

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoviesListing(),
    );
  }
}
