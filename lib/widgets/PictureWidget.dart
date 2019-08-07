import 'package:apod/PictureDetail.dart';
import 'package:apod/entity/Picture.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:apod/entity/Picture.dart';
import 'package:apod/widgets/ExpandableText.dart';

import '../Home.dart';

class PictureWidget extends StatefulWidget {

  PictureWidget({@required this.picture, @required this.index, @required this.callback});

  Picture picture;
  int index;
  final MyCallback callback; //callback instanciado para ser chamado

  @override
  _PictureWidgetState createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {

  Icon _favorite = Icon(Icons.favorite_border, size: 35);
  // Icon _favoriteChecked = Icon(Icons.favorite, color: Colors.red, size: 35);

  void _goToDetail(Picture p) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => PictureDetail(p)
    ));
  }

  void _addToFavorite(Picture p) {
    // p.liked = !p.isLiked;
    // setState(() {
    //   _favorite = p.isLiked ? Icon(Icons.favorite, color: Colors.red, size: 35) : Icon(Icons.favorite_border, size: 35);
    // });
    p.liked = !p.isLiked;
    widget.callback(p, widget.index); //chamando o callback que irá dar like na foto
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                CircleAvatar(backgroundImage: NetworkImage(widget.picture.url)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    widget.picture.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _goToDetail(widget.picture),
            onDoubleTap: () => _addToFavorite(widget.picture),
            child: Hero(//Usado para animar a transição da imagem
              tag: "picture-${widget.picture.title}",
              child: Image.network(
                widget.picture.url,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
            
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: widget.picture.isLiked ? Icon(Icons.favorite, color: Colors.red, size: 35) : Icon(Icons.favorite_border, size: 35)
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: ExpandableText(widget.picture.explanation)
          )
        ],
      ),
    );
  }
}