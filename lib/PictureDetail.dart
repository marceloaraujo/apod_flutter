import 'package:apod/Home.dart';
import 'package:apod/entity/Picture.dart';
import 'package:flutter/material.dart';

class PictureDetail extends StatefulWidget {

  Picture picture;
  int index;
  final MyCallback callback;

  PictureDetail(this.picture, this.callback, this.index);

  @override
  _PictureDetailState createState() => _PictureDetailState();
}

class _PictureDetailState extends State<PictureDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.black87,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(widget.picture.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: 
                  Hero(
                    tag: "picture-${widget.picture.title}",
                    child: Image.network(
                      widget.picture.url,
                      fit: BoxFit.cover,
                    ),
                  )
              ),
            ),
          ];
        },
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              widget.picture.explanation,
              style: TextStyle(
                fontSize: 18
              ),
            ),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.callback(widget.picture, widget.index);
        },
        tooltip: 'Adicionar aos favoritos',
        backgroundColor: Colors.black87,
        child: widget.picture.isLiked ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border)
      ),
    );
  }
}