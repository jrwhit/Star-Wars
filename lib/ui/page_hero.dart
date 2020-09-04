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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage("https://mocah.org/uploads/posts/326361-Star-Wars-TIE-Fighter-Sci-Fi-Fantasy-Space-Planet-4K-iphone-wallpaper.jpg"), fit: BoxFit.fill)
      ),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
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
                        pessoa.nome,
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
                      color: Colors.white.withOpacity(0.01),
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
                        top: sizeH * .25,
                        child: Card(
                          color: Colors.white.withOpacity(.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
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
                                                      color: Colors.white,
                                                      fontSize: sizeW * .025),
                                            ),
                                            TextSpan(
                                              text: pessoa.altura,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
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
                                                      color: Colors.white,
                                                      fontSize: sizeW * .025),
                                            ),
                                            TextSpan(
                                              text: pessoa.peso,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
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
                                                      color: Colors.white,
                                                      fontSize: sizeW * .025),
                                            ),
                                            TextSpan(
                                              text: pessoa.corPele,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
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
                                                      color: Colors.white,
                                                      fontSize: sizeW * .025),
                                            ),
                                            TextSpan(
                                              text: pessoa.corCabelo,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
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
                                                      color: Colors.white,
                                                      fontSize: sizeW * .025),
                                            ),
                                            TextSpan(
                                              text: pessoa.corOlho,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .copyWith(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                child: Container(
                                  width: sizeW,
                                  child: ListResult(pessoa.filmes, "Filmes"),
                                ),
                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(vertical: 16),
//                                child: Container(
//                                  alignment: Alignment.centerLeft,
//                                  width: sizeW,
//                                  child: ListResult(pessoa.naves, "Naves"),
//                                ),
//                              ),
//                              Padding(
//                                padding: EdgeInsets.symmetric(
//                                    vertical: 16, horizontal: 16),
//                                child: Container(
//                                  width: sizeW,
//                                  child:
//                                      ListResult(pessoa.veiculos, "Veículos"),
//                                ),
//                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}