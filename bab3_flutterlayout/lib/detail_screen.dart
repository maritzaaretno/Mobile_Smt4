import 'package:flutter/material.dart';
import 'package:bab3_flutterlayout/model/tourism_place.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.place}) : super(key: key);

  final TourismPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Image.asset(place.imageAsset),
            Container(
                margin: const EdgeInsets.only(top:16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Lobster',
                  ),
                ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget> [
                      Icon(Icons.calendar_today),
                      Text(place.day),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      Text(place.open),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.confirmation_num_sharp),
                      Text (place.cost),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(place.desc,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                    child: Image.network(
                        'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'),
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:ClipRRect(
                      child: Image.asset(place.img1),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:ClipRRect(
                      child: Image.asset(place.img2),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:ClipRRect(
                      child: Image.asset(place.img3),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}