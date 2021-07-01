import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/main.dart';

import 'Model/MovieModel.dart';
import 'Networking/MoviesProvider.dart';

var checkItem;

class MoviesListing extends StatefulWidget {
  @override
  _MoviesListingState createState() => _MoviesListingState();
}

class _MoviesListingState extends State<MoviesListing> {
  //Variable to hold movies information
  List<MovieModel> movies = <MovieModel>[];

  //Method to fetch movies from network
  PopularMoviesFetch() async {
    //Fetching data from sever
    var data = await MoviesProvider.PopulerGetJson();

    setState(() {
      //Holding data from server in generic list results
      List<dynamic> results = data["results"];

      //Iterating over results list and converting to MovieModel
      results.forEach((element) {
        movies.add(MovieModel.fromJson(element));
      });
    });
  }

  TopRateMoviesFetch() async {
    //Fetching data from sever
    var data = await MoviesProvider.TopRategetJson();

    setState(() {
      //Holding data from server in generic list results
      List<dynamic> results = data["results"];

      //Iterating over results list and converting to MovieModel
      results.forEach((element) {
        movies.add(MovieModel.fromJson(element));
      });
    });
  }

  ScienceFictionMoviesFetch() async {
    //Fetching data from sever
    var data = await MoviesProvider.ScienceFictiongetJson();

    setState(() {
      //Holding data from server in generic list results
      List<dynamic> results = data["results"];

      //Iterating over results list and converting to MovieModel
      results.forEach((element) {
        movies.add(MovieModel.fromJson(element));
      });
    });
  }

  ComedyMoviesFetch() async {
    //Fetching data from sever
    var data = await MoviesProvider.ComedygetJson();

    setState(() {
      //Holding data from server in generic list results
      List<dynamic> results = data["results"];

      //Iterating over results list and converting to MovieModel
      results.forEach((element) {
        movies.add(MovieModel.fromJson(element));
      });
    });
  }

  NewmoviesFetch2021() async {
    //Fetching data from sever
    var data = await MoviesProvider.Newmovies2021getJson();

    setState(() {
      //Holding data from server in generic list results
      List<dynamic> results = data["results"];

      //Iterating over results list and converting to MovieModel
      results.forEach((element) {
        movies.add(MovieModel.fromJson(element));
      });
    });
  }
  // mainapi() async {
  //   //Fetching data from sever
  //   var data = await MoviesProvider.mainGetJson();
  //
  //   setState(() {
  //     //Holding data from server in generic list results
  //     List<dynamic> results = data[''];
  //
  //     //Iterating over results list and converting to MovieModel
  //     results.forEach((element) {
  //       movies.add(MovieModel.fromJson(element));
  //     });
  //   });
  // }


  @override
  void initState() {
    //Fetch movies
    defaultChoiceIndex = 0;
    // mainapi();
    // PopularMoviesFetch();
    // TopRateMoviesFetch();
    // ScienceFictionMoviesFetch();
    // ComedyMoviesFetch();
    // NewmoviesFetch2021();
    super.initState();
  }

  List<String> _choicesList = [
    'All',
    'Popular',
    'Top Rate',
    'Science Fiction',
    'Comedy',
    '2021',
  ];

  int? defaultChoiceIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Rank'),
      ),
      //SingleChildScrollView to provide scrolling for flexible data rendering
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  child: Wrap(
                    spacing: 8,
                    children: List.generate(_choicesList.length, (index) {
                      return ChoiceChip(
                        labelPadding: EdgeInsets.all(2.0),
                        label: Text(
                          _choicesList[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.white, fontSize: 14),
                        ),
                        selected: defaultChoiceIndex == index,
                        selectedColor: Colors.deepPurple,
                        onSelected: (value) {
                          setState(() {
                            checkItem = _choicesList[index];
                            print(checkItem);
                            if (index == 1) {
                              movies.clear();
                              PopularMoviesFetch();
                            } else if (index == 2) {
                              movies.clear();
                              TopRateMoviesFetch();
                            } else if (index == 3) {
                              movies.clear();
                              ScienceFictionMoviesFetch();
                            } else if (index == 4) {
                              movies.clear();
                              ComedyMoviesFetch();
                            } else if (index == 5) {
                              movies.clear();
                              NewmoviesFetch2021();
                            } else if (index == 0) {
                              movies.clear();
                              PopularMoviesFetch();
                              TopRateMoviesFetch();
                              ScienceFictionMoviesFetch();
                              ComedyMoviesFetch();
                              NewmoviesFetch2021();
                            }
                            defaultChoiceIndex =
                                value ? index : defaultChoiceIndex;
                          });
                        },
                        backgroundColor: Colors.green,
                        elevation: 1,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                child: ListView.builder(
                    itemCount: movies == null ? 0 : movies.length,
                    itemBuilder: (context, index) {
                      return MovieTile(movies, index);
                    })),
          ),
        ],
      ),
    );
  }
}

class MovieTile extends StatefulWidget {
  final List<MovieModel> movies;
  final index;

  const MovieTile(this.movies, this.index);

  @override
  _MovieTileState createState() => _MovieTileState();
}

class _MovieTileState extends State<MovieTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.movies[widget.index].title);
      },
      child: Padding(
        //padding around the entry
        padding: const EdgeInsets.all(8.0),
        //Since information is displayed vertically, Column widget is used
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            widget.movies[widget.index].poster_path != null
                ? Container(
                    //Making image's width to half of the given screen size
                    width: MediaQuery.of(context).size.width / 3,

                    //Making image's height to one fourth of the given screen size
                    height: MediaQuery.of(context).size.height / 5,

                    //Making image box visually appealing by dropping shadow
                    decoration: BoxDecoration(
                      //Making image box slightly curved
                      borderRadius: BorderRadius.circular(10.0),
                      //Setting box's color to grey
                      color: Colors.grey,

                      //Decorating image
                      image: DecorationImage(
                          image: NetworkImage(MoviesProvider.imagePathPrefix +
                              widget.movies[widget.index].poster_path),
                          //Image getting all the available space
                          fit: BoxFit.cover),

                      //Dropping shadow
                      boxShadow: [
                        BoxShadow(
                            //grey colored shadow
                            color: Colors.grey,
                            //Applying softening effect
                            blurRadius: 3.0,
                            //move 1.0 to right (horizontal), and 3.0 to down (vertical)
                            offset: Offset(1.0, 3.0)),
                      ],
                    ),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      //Setting box's color to grey
                      color: Colors.grey,
                      image: DecorationImage(
                        image: AssetImage('ImageAsset/noimage.png'),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          //grey colored shadow
                            color: Colors.grey,
                            //Applying softening effect
                            blurRadius: 3.0,
                            //move 1.0 to right (horizontal), and 3.0 to down (vertical)
                            offset: Offset(1.0, 3.0)),
                      ],
                    ),
                  ), //Empty container when image is not available

            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        //title text
                        widget.movies[widget.index].title,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        //setting fontSize and making it bold
                        style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Release date : ${widget.movies[widget.index].release_date.toString()}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          widget.movies[widget.index].original_language == 'en'
                              ? Text('Language : English')
                              : Text('Others'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(

                              '${widget.movies[widget.index].vote_average.toString()}'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   //Movie descripton text
            //   child: Text(
            //     widget.movies[widget.index].overview,
            //   ),
            // ),
            Divider(color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
