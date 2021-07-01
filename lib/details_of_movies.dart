import 'package:flutter/material.dart';
import 'package:restapi/Networking/MoviesProvider.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);
  static String id = 'Details';

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFCF82DA),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Color(0xFFCF82DA),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              color: Color(0xFFCF82DA),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'The game of thoren',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 220,
                    decoration: BoxDecoration(
                      //Making image box slightly curved
                      borderRadius: BorderRadius.circular(20.0),
                      //Setting box's color to grey
                      color: Colors.grey,
                      //Decorating image
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.daznservices.com/di/library/GOAL/2/7f/sadio-mane-liverpool-2020-21_15v2z5xcvrs9p1by2ebt86jo9h.jpg?quality=60&w=1000"),
                        //Image getting all the available space
                        fit: BoxFit.cover,
                      ),

                      //Dropping shadow
                      boxShadow: [
                        BoxShadow(
                            //grey colored shadow
                            color: Colors.red,
                            //Applying softening effect
                            blurRadius: 3.0,
                            //move 1.0 to right (horizontal), and 3.0 to down (vertical)
                            offset: Offset(1.0, 3.0)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Overview',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Overviffffffffffffffffffffffffffffffffffffffffffffffffgfffdfsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaafffffffffffffffffffffffffffffffffffffffffffffffffffffffffffddddddddddddddddddddffffffew',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFC53A84),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            //grey colored shadow
                              color: Colors.red,
                              //Applying softening effect
                              blurRadius: 20.0,
                              //move 1.0 to right (horizontal), and 3.0 to down (vertical)
                              offset: Offset(0.0, 10.0)),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Rating',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '10.0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Popularity',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '10.0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'VoteCount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,

                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '10.0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Release',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '10.0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
