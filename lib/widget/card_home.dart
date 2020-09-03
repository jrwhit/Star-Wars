import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:star_wars/model/Pessoa.dart';

// ignore: must_be_immutable
class TileResult extends StatefulWidget {
  TileResult({Key key,@required this.pessoa}) : super(key: key);
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
    print(widget.pessoa.nome);
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Padding(padding: EdgeInsets.only(top: 6), child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.pessoa.nome, style: TextStyle(color: Colors.black), maxLines: 1,),
            Divider(),
            Text(widget.pessoa.altura, style: TextStyle(color: Colors.black), maxLines: 1,),
          ],
        ),),
      ),
    );
  }
}