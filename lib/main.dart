import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restapi/bal.dart';
import 'package:restapi/details_of_movies.dart';
import 'package:restapi/moviesList.dart';

void main() {
  runApp(MoviesApp());
}

//REPLACE: Replace YOUR_API_KEY with your API key
final apiKey = "d35cb2cc5a7b666b8ac606fb831c6e66";
final countnumber = 0;

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MoviesListing.id,
      routes: {
        MoviesListing.id: (context) => MoviesListing(),
      },
    );
  }
}
