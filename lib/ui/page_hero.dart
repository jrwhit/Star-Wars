import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/Pessoa.dart';
import 'package:star_wars/widget/list_detalhes.dart';
import 'package:star_wars/widget/my_hero.dart';

class PageHero extends StatelessWidget {
  PageHero(this.pessoa);
  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    var themeText = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black87,
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
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Padding(
                    padding: EdgeInsets.only(left: sizeW * 0.2),
                    child: Text(
                      "Star Wars",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: sizeH * 0.04),
              child: Stack(
                children: <Widget>[
                  Card(
                    elevation: 3,
                    color: Colors.green.withOpacity(0.12),
                    child: Column(
                      children: <Widget>[
                        MyHero(
                          photo: pessoa.image,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: sizeH * 0.015,
                      left: sizeW * 0.05,
                      child: Text(
                        "Jedi",
                        style: themeText.caption.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16,
                            shadows: <Shadow>[
                              Shadow(color: Colors.grey[200], blurRadius: 16)
                            ]),
                      )),
                  Positioned(
                      top: sizeH * .25,
                      left: sizeW * .15,
                      child: Card(
                        color: Colors.white.withOpacity(.1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                pessoa.nome,
                                style: TextStyle(color: Colors.yellow),
                                maxLines: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                                                fontSize: sizeW * .025),
                                          ),
                                          TextSpan(
                                            text: pessoa.altura,
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
                                                fontSize: sizeW * .025),
                                          ),
                                          TextSpan(
                                            text: pessoa.peso,
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
                                                fontSize: sizeW * .025),
                                          ),
                                          TextSpan(
                                            text: pessoa.corPele,
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
                                                fontSize: sizeW * .025),
                                          ),
                                          TextSpan(
                                            text: pessoa.corCabelo,
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
                                                fontSize: sizeW * .025),
                                          ),
                                          TextSpan(
                                            text: pessoa.corOlho,
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
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              child: Container(
                                width: sizeW * 0.6,
                                child: ListResult(pessoa.filmes, "Filmes"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              child: Container(
                                width: sizeW * 0.6,
                                child: ListResult(pessoa.naves, "Naves"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                              child: Container(
                                width: sizeW * 0.6,
                                child: ListResult(pessoa.veiculos, "Veículos"),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
