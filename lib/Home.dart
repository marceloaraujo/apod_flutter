import 'package:apod/config/RestService.dart';
import 'package:flutter/material.dart';
import 'package:apod/entity/Picture.dart';
import 'package:apod/widgets/PictureWidget.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

typedef void MyCallback(Picture p, int index); //Criando um callback

class _HomeState extends State<Home> {

  List<Picture> pictures = List();


  void _getPictures() {
    RestService.getPictures().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        pictures = list.map((model) => Picture.fromJson(model)).toList();
        print(pictures);
      });
    });
  }

  void addToFavorite(Picture p, int index) {
    setState(() {
      pictures[index] = p;
    });
  }

  @override
  void initState() {
    super.initState();
    _getPictures();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("APOD"),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: pictures.length,
          itemBuilder: (context, index) {
            Picture p = pictures[index];
            return PictureWidget(
              picture: p,
              index: index,
              callback: addToFavorite, //passando a função que será chamada para dar like na foto
            );
          },
        ),
      ),
    );
  }
}