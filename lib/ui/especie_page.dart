import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/especie.dart';
import 'package:star_wars/widget/list_detalhes.dart';

class SpeciePage extends StatelessWidget {
  SpeciePage(this.especie);
  final Especie especie;

  Widget paragraph(style, text, text2, colorFont) {
    return RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            style: style.headline2.copyWith(
                color: colorFont, fontSize: 16.0, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                  text: text,style: TextStyle(color: Colors.yellowAccent)
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
                  image: DecorationImage(image: AssetImage(
                      "assets/images/specie.jpg"),
                      fit: BoxFit.fill)),
              child: Scaffold(
                backgroundColor: Colors.black.withOpacity(0.3),
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
                                "Specie",
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
                                  especie.image,
                                )),
                            Text(
                              especie.nome,
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
                                    paragraph(themeText, "Name: \n", especie.nome,
                                        Colors.white),
                                    paragraph(themeText, "Average Height: \n", especie.altMedia,
                                        Colors.white),
                                  ]),
                                  TableRow(children: [
                                    paragraph(themeText, "Classification: \n",
                                        especie.classificacao, Colors.white),
                                    paragraph(themeText, "designacao: \n",
                                        especie.designacao, Colors.white),
                                  ]),
                                  TableRow(children: [
                                    paragraph(themeText, "Hair Colors: \n", especie.corC,
                                        Colors.white),
                                    paragraph(themeText, "skin Colors: \n", especie.corP,
                                        Colors.white),
                                  ]),
                                  TableRow(children: [
                                    paragraph(themeText, "Language: \n", especie.linguagem,
                                        Colors.white),
                                    paragraph(themeText, "Homeworld: \n",
                                        especie.mundo != null ? especie.mundo.nome : "N/A",
                                        Colors.white),
                                  ]),
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                child: Container(
                                  width: sizeW * 0.6,
                                  child: ListResult(especie.listFilm, "Films"),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                child: Container(
                                  width: sizeW * 0.6,
                                  child: ListResult(especie.listPessoas, "Peoples"),
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