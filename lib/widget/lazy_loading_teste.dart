import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/Pessoa.dart';
import 'package:star_wars/model/film.dart';
import 'package:star_wars/model/nave.dart';
import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/model/veiculo.dart';
import 'package:star_wars/service/conexao.dart';
import 'package:star_wars/ui/filme_page.dart';
import 'package:star_wars/ui/nave_page.dart';
import 'package:star_wars/ui/people_page.dart';
import 'package:star_wars/ui/veiculo_page.dart';

class LazyLoading extends StatefulWidget {
  LazyLoading(this.title, this.rota);
  String title, rota;

  @override
  _LazyLoadingState createState() => _LazyLoadingState(title, rota);
}

class _LazyLoadingState extends State<LazyLoading> {
  _LazyLoadingState(this._title, this._rota);
  String _title, _rota;

  int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  List listResult = new List();
  final dio = new Dio();
  bool fimList = false;
  Result result;

  @override
  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels ==
          _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  void _getMoreData(int index) async {
    if(fimList){
//
    }else{
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        var url = _rota+"?page=" +
            index.toString();
        print(url);
        final response = await dio.get(url);
        List tList = new List();
        for (int i = 0; i < response.data['results'].length; i++) {
          tList.add(response.data['results'][i]);
        }
        if(response.data['next'] == null){
          setState(() {
            isLoading = false;
            listResult.addAll(tList);
            fimList = true;
          });
        }else{
          setState(() {
            isLoading = false;
            listResult.addAll(tList);
            page++;
            log("$page", name: "olha eu aqui");
          });
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 10),
    child: Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.03,
//                color: Colors.yellowAccent.withOpacity(0.1),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 6),
              child: Text(_title,
                  style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12)),
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.24,
          color: Colors.blue.withOpacity(0.1),
          child: _buildList(),
        )
      ],
    ),);
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: listResult.length + 1,
      padding: EdgeInsets.symmetric(vertical: 8.0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        if (index == listResult.length) {
          return _buildProgressIndicator();
        } else {
          switch (_title) {
            case "Peoples":
              result = Result(
                  listResult[index]["name"],
                  listResult[index]["birth_year"],
                  listResult[index]["gender"].toString(),
                  listResult[index]["url"],
                  _title.toString().toLowerCase());
              break;
            case "Films":
              result = Result(
                  listResult[index]["title"],
                  listResult[index]["director"],
                  listResult[index]["episode_id"].toString(),
                  listResult[index]["url"],
                  _title.toString().toLowerCase());
              break;
            case "Starships":
              result = Result(
                  listResult[index]["name"],
                  listResult[index]["starship_class"],
                  listResult[index]["model"],
                  listResult[index]["url"],
                  _title.toString().toLowerCase());
              result.nave = Nave().fromMap(listResult[index]);
              break;
            case "Vehicles":
              result = Result(
                  listResult[index]["name"],
                  listResult[index]["vehicle_class"],
                  listResult[index]["model"],
                  listResult[index]["url"],
                  _title.toString().toLowerCase());
              break;
          }
//                  var pessoa = Pessoa().fromMap(map['results'][index]);
          result.image = "assets/images/quinRetrato.png";
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height * .09,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    backgroundImage: NetworkImage(
                        "https://img2.wikia.nocookie.net/__cb20100915165213/starwars/images/8/84/QuiGonJinn-SWSB.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      result.titulo,
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/loading.gif"),
                              fit: BoxFit.cover)),
                      alignment: FractionalOffset.center,
                      height: MediaQuery.of(context).size.width * 0.5,
                      width: MediaQuery.of(context).size.width * 0.2,
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        strokeWidth: 5.0,
                      ),
                    ),
                  ));
              switch (result.type) {
                case "peoples":
                  Pessoa pessoa;
                  ConexaoApi()
                    ..carregarLink(listResult[index]["url"]).then((value) {
                      pessoa = Pessoa().fromMap(value);
                      pessoa.image = "assets/images/quinRetrato.png";
                      ConexaoApi()
                          .carregarLink(value["homeworld"])
                          .then((planet) => pessoa.planeta =
                          Planeta().fromMap(planet))
                          .whenComplete(() {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PageHero(pessoa)));
                      });
                    });
                  break;
                case "starships":
                  Nave nave;
                  ConexaoApi()
                    ..carregarLink(listResult[index]["url"])
                        .then((value) => nave = Nave().fromMap(value))
                        .whenComplete(() {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NavePage(nave)));
                    });
                  break;
                case "films":
                  Filme filme;
                  ConexaoApi()
                    ..carregarLink(listResult[index]["url"])
                        .then((value) => filme = Filme().fromMap(value))
                        .whenComplete(() {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PageFilm(filme)));
                    });
                  break;
                case "vehicles":
                  Veiculo veiculo;
                  ConexaoApi()
                    ..carregarLink(listResult[index]["url"])
                        .then((value) =>
                    veiculo = Veiculo().fromMap(value))
                        .whenComplete(() {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VeiculoPage(veiculo)));
                    });
                  break;
              }
            },
          );
        }
      },
      controller: _sc,
    );
  }
  Widget _buildProgressIndicator() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            strokeWidth: 5.0,
          ),
        ),
      ),
    );
  }
}

class Result {
  String titulo, subtitulo, trailing, link, type;
  Nave nave;
  String image;
  Filme film;
  Veiculo veiculo;
  Result(this.titulo, this.subtitulo, this.trailing, this.link, this.type);
}
