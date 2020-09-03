import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/Pessoa.dart';

// ignore: must_be_immutable
class TileResult extends StatefulWidget {
  TileResult({Key key, @required this.pessoa}) : super(key: key);
  final Pessoa pessoa;
  @override
  _TileResultState createState() => _TileResultState();
}

class _TileResultState extends State<TileResult> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sH = MediaQuery.of(context).size.height;
    var sW = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: sH * .09,
          backgroundColor: Colors.grey[700],
          backgroundImage: NetworkImage(
              "https://img2.wikia.nocookie.net/__cb20100915165213/starwars/images/8/84/QuiGonJinn-SWSB.png"),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            widget.pessoa.nome,
            style: TextStyle(color: Colors.white),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}