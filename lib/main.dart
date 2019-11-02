import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<String> list = [
    'http://books.google.com/books/content?id=Rgg0AQAAMAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
    'http://books.google.com/books/content?id=fiBbdJ1sdA8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
    'http://books.google.com/books/content?id=8CSFs_Usw8MC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api',
    'http://books.google.com/books/content?id=z9M1AAAAMAAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Scaffold(
            body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 40, left: 20),
                child: Text(
                  'Find Your',
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  'Favourite Books',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Madame'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search by book or author',
                    prefixIcon: Icon(Icons.search)),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10),
                child: Text(
                  'Your Search results',
                  style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: new BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.2),
                                    blurRadius: 10.0,
                                    // has the effect of softening the shadow
                                    spreadRadius: 1.0,
                                    // has the effect of extending the shadow
                                    offset: Offset(
                                      1.0, // horizontal, move right 10
                                      5.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                              ),
                              child: new ClipRRect(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  child: Image.network(list[i],
                                      width: 100,
                                      height: 150,
                                      fit: BoxFit.fill)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'book ',
                                style: TextStyle(
                                    fontSize: 15, fontFamily: 'Roboto'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: RatingBar(
                                initialRating: 10,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        )));
  }
}
