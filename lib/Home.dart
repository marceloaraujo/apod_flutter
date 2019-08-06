import 'package:flutter/material.dart';
import 'package:apod/entity/Picture.dart';
import 'package:apod/widgets/PictureWidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Picture> pictures = List();

  void _setPictures() {
    Picture p = Picture();
    p.title = "The Local Void in the Nearby Universe";
    p.explanation = "What does our region of the Universe look like? Since galaxies are so spread out over the sky, and since our Milky Way Galaxy blocks part of the distant sky, it has been hard to tell. A new map has been made, however, using large-scale galaxy motions to infer what massive objects must be gravitating in the nearby universe. The featured map, spanning over 600 million light years on a side, shows that our Milky Way Galaxy is on the edge of the Virgo Cluster of Galaxies, which is connected to the Great Attractor -- an even larger grouping of galaxies. Also nearby are the massive Coma Cluster and the extensive Perseus-Pisces Supercluster. Conversely, we are also on the edge of huge region nearly empty of galaxies known as the Local Void.  The repulsive push by the Local Void combined with the gravitational pull toward the elevated galaxy density on the other side of the sky explains part of the mysteriously high speed our Galaxy has relative to the cosmic microwave background -- but not all.  To explore the local universe yourself, as determined by Cosmicflows-3, you are invited to zoom in and spin around this interactive 3D visualization.";
    p.mediaType = "image";
    p.url = "https://apod.nasa.gov/apod/image/1908/VoidMap_Tully_960.jpg";
    p.date = DateTime.parse("2019-08-06");
    pictures.add(p);
    pictures.add(p);
    pictures.add(p);
  }

  @override
  Widget build(BuildContext context) {

    pictures = List();
    _setPictures();

    return Scaffold(
      appBar: AppBar(
        title: Text("APOD"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: pictures.length,
          itemBuilder: (context, index) {
            Picture p = pictures[index];
            return PictureWidget(
              picture: p
            );
          },
        ),
      ),
    );
  }
}