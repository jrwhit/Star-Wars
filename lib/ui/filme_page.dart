import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/film.dart';
import 'package:star_wars/widget/list_detalhes.dart';

class PageFilm extends StatelessWidget {
  PageFilm(this.film);
  final Filme film;

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    var themeText = Theme.of(context).textTheme;
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage("https://wallpapers.moviemania.io/phone/movie/181812/877f43/star-wars-the-rise-of-skywalker-phone-wallpaper.jpg?w=1536&h=2732"))),
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
                        "Filme",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: sizeH * 0.05, horizontal: sizeW * 0.1),
              child: Container(
                padding: EdgeInsets.only(bottom: 18),
                color: Colors.white.withOpacity(0.1),
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/r2d2.png"),
                    Text(film.titulo, style: themeText.caption.copyWith(color: Colors.white, fontSize: 20),),
                    Text(film.producao, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16),),
                    Text(film.diretor, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16),),
                    Text(film.dataLancamento, style: themeText.headline2.copyWith(color: Colors.yellowAccent, fontSize: 16),),
                    Text("Episode: ${film.epId}", style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16),),
                    Text(film.abertura, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Container(
                        width: sizeW * 0.6,
                        child: ListResult(film.listPessoa, "Characters"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Container(
                        width: sizeW * 0.6,
                        child: ListResult(film.listPlanetas, "Planets"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Container(
                        width: sizeW * 0.6,
                        child: ListResult(film.listNave, "Starships"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Container(
                        width: sizeW * 0.6,
                        child: ListResult(film.listVeiculo, "Vehicles"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: Container(
                        width: sizeW * 0.6,
                        child: ListResult(film.listEspecie, "species"),
                      ),
                    ),
                  ],
                ),
              ),)
            ],
          ),
        ),
      ),
    ));
  }
}
