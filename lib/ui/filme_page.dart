import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/film.dart';
import 'package:star_wars/widget/list_detalhes.dart';

class PageFilm extends StatelessWidget {
  PageFilm(this.film);
  final Filme film;

  Widget buildList(sizeW, list, title){
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Container(
        width: sizeW * 0.9,
        child: ListResult(list, title),
      ),
    );
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
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://wallpapers.moviemania.io/phone/movie/181812/877f43/star-wars-the-rise-of-skywalker-phone-wallpaper.jpg?w=1536&h=2732"))),
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
                                film.titulo,
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: sizeH * 0.05),
                        child: Container(
                          width: sizeW,
                          padding: EdgeInsets.only(bottom: 18),
                          color: Colors.white.withOpacity(0.1),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                width: sizeW,
                                height: sizeH * 0.2,
                                child: Image.network(
                                  "https://www.syfy.com/sites/syfy/files/styles/1200x680_hero/public/2017/12/star_wars_header_0.jpg",
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                              Container(
                                width: sizeW,
                                height: sizeH * 0.2,
                                color: Colors.white.withOpacity(0.1),
                                child: Row(
                                  children: <Widget>[
                                    Image.network(
                                      "https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg",
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 12),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            film.titulo,
                                            textAlign: TextAlign.left,
                                            style: themeText.caption.copyWith(
                                                color: Colors.white, fontSize: 16),
                                          ),
                                          Text(
                                            "Producer: ${film.producao}",
                                            style: themeText.headline2.copyWith(
                                                color: Colors.white, fontSize: 12),
                                          ),
                                          Text(
                                            "Director: ${film.diretor}",
                                            style: themeText.headline2.copyWith(
                                                color: Colors.white, fontSize: 12),
                                          ),
                                          Text(
                                            "Date: ${film.dataLancamento}",
                                            style: themeText.headline2.copyWith(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            "Episode: ${film.epId}",
                                            style: themeText.headline2.copyWith(
                                                color: Colors.white, fontSize: 12),
                                          ),
                                          Expanded(
                                            child: Text(
                                              film.abertura,
                                              overflow: TextOverflow.clip,
                                              style: themeText.headline2.copyWith(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              buildList(sizeW, film.listPessoa, "Characters"),
                              buildList(sizeW, film.listPlanetas, "Planets"),
                              buildList(sizeW, film.listNave, "Starships"),
                              buildList(sizeW, film.listVeiculo, "Vehicles"),
                              buildList(sizeW, film.listEspecie, "Species"),
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
