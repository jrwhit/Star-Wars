import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/widget/list_detalhes.dart';

class PlanetPage extends StatelessWidget {
  PlanetPage(this.planeta);
  final Planeta planeta;

  Widget paragraph(style, text, text2, colorFont) {
    return RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            style: style.headline2.copyWith(
                color: colorFont, fontSize: 16.0, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: text,
              ),
              TextSpan(
                text: text2,
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    var themeText = Theme.of(context).textTheme;
    return Stack(
      children: <Widget>[
        SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/ceu.png"))),
              child: Scaffold(
                backgroundColor: Colors.white.withOpacity(0.01),
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Card(
                        color: Colors.white.withOpacity(0.1),
                        elevation: 0,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                            Padding(
                              padding: EdgeInsets.only(left: sizeW * 0.2),
                              child: Text(
                                "Planeta",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Stack(
                          children: <Widget>[
                            Image(
                                height: MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width,
                                image: NetworkImage(
                                  "https://img.swcombine.com//galaxy/planets/custom/large/130.gif",
                                )),
                            Text(
                              planeta.nome,
                              style: themeText.caption.copyWith(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: sizeH * 0.05, horizontal: sizeW * 0.1),
                        child: Container(
                          width: sizeW,
                          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                          color: Colors.white.withOpacity(0.1),
                          child: Column(
                            children: <Widget>[
                              Table(
                                columnWidths: {2: FractionColumnWidth(.3)},
                                children: [
                                  TableRow(children: [
                                    paragraph(themeText, "Name: ", planeta.nome,
                                        Colors.white),
                                    paragraph(themeText, "Rotation: ", planeta.rotPeriodo,
                                        Colors.white),
                                  ]),
                                  TableRow(children: [
                                    paragraph(themeText, "Orbital: ",
                                        planeta.orbPeriodo, Colors.white),
                                    paragraph(themeText, "Diameter: ",
                                        planeta.diametro, Colors.white),
                                  ]),
                                  TableRow(children: [
                                    paragraph(themeText, "Climate: ", planeta.clima,
                                        Colors.white),
                                    paragraph(themeText, "Gravity: ", planeta.gravidade,
                                        Colors.white),
                                  ]),
                                  TableRow(children: [
                                    paragraph(themeText, "Terrain: ", planeta.terreno,
                                        Colors.white),
                                    paragraph(themeText, "Population: ", planeta.populacao,
                                        Colors.white),
                                  ]),
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                child: Container(
                                  width: sizeW * 0.6,
                                  child: ListResult(planeta.listPessoas, "Residents"),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                child: Container(
                                  width: sizeW * 0.6,
                                  child: ListResult(planeta.listFilmes, "Films"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}