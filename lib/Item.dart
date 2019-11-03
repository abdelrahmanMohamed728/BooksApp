import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Item extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ItemState();
  }
}

class _ItemState extends State<Item> {
  String Link =
      'http://books.google.com/books/content?id=fiBbdJ1sdA8C&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api';
  String des =
      'A mesmerizing, moving, and elegantly written debut novel, The Language of Flowers beautifully weaves past and present, creating a vivid portrait of an unforgettable woman whose gift for flowers helps her change the lives of others even as she struggles to overcome her own troubled past';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(Link),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(25.0),
                    child: Hero(
                      child: Image.network(Link,
                          width: 150, height: 180, fit: BoxFit.fill),
                      tag: 'icon 1',
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white),
                      height: 400,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 20),
                            child: Text(
                              'the language of flowers',
                              style: TextStyle(
                                  fontFamily: 'noodle',
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, left: 20.0,right: 20),
                            child: RatingBar(
                              initialRating: 10,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, left: 20.0,right: 20),
                            child: Text(
                              des,
                              style: TextStyle(fontFamily: 'Roboto'),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
