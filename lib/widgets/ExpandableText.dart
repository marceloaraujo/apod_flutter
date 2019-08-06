import 'package:flutter/material.dart';

/**
 * Código tirado de https://stackoverflow.com/questions/49572747/flutter-how-to-hide-or-show-more-text-within-certain-length
 */

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);

  final String text;
  bool descTextShowFlag = false;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.text, maxLines: widget.descTextShowFlag ? null : 2, textAlign: TextAlign.start),
        InkWell(
          onTap: (){ setState(() {
          widget.descTextShowFlag = !widget.descTextShowFlag; 
          }); },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              widget.descTextShowFlag ? Text("menos",style: TextStyle(color: Colors.blue),) :  Text("mais",style: TextStyle(color: Colors.blue))
            ],
          ),
        )
      ],
    );
  }
}