import 'package:flutter/material.dart';
import 'package:apod/entity/Picture.dart';
import 'package:apod/widgets/ExpandableText.dart';

class PictureWidget extends StatefulWidget {

  PictureWidget({@required this.picture});

  Picture picture;

  @override
  _PictureWidgetState createState() => _PictureWidgetState();
}

class _PictureWidgetState extends State<PictureWidget> {
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
                ),
                Text(
                  widget.picture.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                  )
              ],
            ),
          ),
          Image.network(
            widget.picture.url,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Icon(
                  Icons.favorite_border,
                  size: 35
                ),
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