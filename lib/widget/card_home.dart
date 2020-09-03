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
    return Stack(
      children: <Widget>[
        Card(
          color: Colors.black,
          child: ListTile(
            title: Padding(
              padding: EdgeInsets.only(top: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      widget.pessoa.nome,
                      style: TextStyle(color: Colors.yellow),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: sW * 0.22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Height\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                          color: Colors.yellowAccent,
                                          fontSize: sW * .025),
                                ),
                                TextSpan(
                                  text: widget.pessoa.altura,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(color: Colors.yellowAccent,
                                      fontSize: 16,
                                  shadows: [
                                    Shadow(color: Colors.red[500],
                                        offset: Offset(0, 4),
                                        blurRadius: 1.9)
                                  ]),
                                )
                              ],
                            )),
                        SizedBox(width: 10),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Mass\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                      color: Colors.yellowAccent,
                                      fontSize: sW * .025),
                                ),
                                TextSpan(
                                  text: widget.pessoa.peso,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(color: Colors.yellowAccent,
                                      fontSize: 16,
                                      shadows: [
                                        Shadow(color: Colors.red[500],
                                            offset: Offset(0, 4),
                                            blurRadius: 1.9)
                                      ]),
                                )
                              ],
                            )),
                        SizedBox(width: 10),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Skin\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                      color: Colors.yellowAccent,
                                      fontSize: sW * .025),
                                ),
                                TextSpan(
                                  text: widget.pessoa.corPele,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(color: Colors.yellowAccent,
                                      fontSize: 16,
                                      shadows: [
                                        Shadow(color: Colors.red[500],
                                            offset: Offset(0, 4),
                                            blurRadius: 1.9)
                                      ]),
                                )
                              ],
                            )),
                        SizedBox(width: 10),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Hair\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                      color: Colors.yellowAccent,
                                      fontSize: sW * .025),
                                ),
                                TextSpan(
                                  text: widget.pessoa.corCabelo,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(color: Colors.yellowAccent,
                                      fontSize: 16,
                                      shadows: [
                                        Shadow(color: Colors.red[500],
                                            offset: Offset(0, 4),
                                            blurRadius: 1.9)
                                      ]),
                                ),
                              ],
                            )),
                        SizedBox(width: 10),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Eye\n",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                      color: Colors.yellowAccent,
                                      fontSize: sW * .025),
                                ),
                                TextSpan(
                                  text: widget.pessoa.corOlho,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(color: Colors.yellowAccent,
                                      fontSize: 16,
                                      shadows: [
                                        Shadow(color: Colors.red[500],
                                            offset: Offset(0, 4),
                                            blurRadius: 1.9)
                                      ]),
                                )
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: sW / 50,
            left: 10,
            child: CircleAvatar(
              radius: sH * .06,
              backgroundColor: Colors.white.withOpacity(0.1),
              backgroundImage: NetworkImage(
                  "https://www.seekpng.com/png/detail/189-1897050_qui-gon-is-sexy-in-a-dad-kind.png"),
            )),
      ],
    );
  }
}
