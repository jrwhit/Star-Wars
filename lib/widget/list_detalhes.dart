import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/Pessoa.dart';
import 'package:star_wars/model/especie.dart';
import 'package:star_wars/model/film.dart';
import 'package:star_wars/model/nave.dart';
import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/model/veiculo.dart';
import 'package:star_wars/service/conexao.dart';
import 'package:star_wars/ui/especie_page.dart';
import 'package:star_wars/ui/filme_page.dart';
import 'package:star_wars/ui/nave_page.dart';
import 'package:star_wars/ui/people_page.dart';
import 'package:star_wars/ui/planet_page.dart';
import 'package:star_wars/ui/veiculo_page.dart';
class ListResult extends StatefulWidget {
  ListResult(this.list, this.title);
  List<String> list;
  String title;

  @override
  _ListResultState createState() => _ListResultState(list, title);
}

class _ListResultState extends State<ListResult> with AutomaticKeepAliveClientMixin{
  _ListResultState(this._list, this._title);
  List<String> _list;
  String _title;
  Result result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.03,
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
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  controller: ScrollController(
                  ),
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemExtent: MediaQuery.of(context).size.width * 0.6,
                  scrollDirection: Axis.horizontal,
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) => Dialog(
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/loading.gif"),
                                        fit: BoxFit.cover
                                    )
                                ),
                                alignment: FractionalOffset.center,
                                height: MediaQuery.of(context).size.width * 0.5,
                                width: MediaQuery.of(context).size.width * 0.2,
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(" ", style: TextStyle(color: Colors.white),),
                                    ),
                                    CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                      strokeWidth: 5.0,
                                    ),
                                  ],
                                ),
                              ),
                            ));
                        switch (result.type) {
                          case "residents":
                          case "characters":
                          case "peoples":
                          case "pilots":
                            Pessoa pessoa;
                            ConexaoApi()
                              ..carregarLink(_list[index]).then((value) {
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
                              ..carregarLink(_list[index])
                                  .then((value) => nave = Nave().fromMap(value))
                                  .whenComplete(() {
                                Navigator.of(context).pop();
                                nave.image = "https://www.crazyhappyfuntime.com/swimg/starships/${_list[index].replaceAll(RegExp(r'[^0-9]'), "")}/"
                                    "1.jpg";
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => NavePage(nave)));
                              });
                            break;
                          case "films":
                            Filme filme;
                            ConexaoApi()
                              ..carregarLink(_list[index])
                                  .then(
                                      (value) => filme = Filme().fromMap(value))
                                  .whenComplete(() {
                                Navigator.of(context).pop();
                                filme.image = "https://www.crazyhappyfuntime.com/swimg/films/${_list[index].replaceAll(RegExp(r'[^0-9]'), "")}/"
                                    "1.jpg";
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PageFilm(filme)));
                              });
                            break;
                          case "vehicles":
                            Veiculo veiculo;
                            ConexaoApi()
                              ..carregarLink(_list[index])
                                  .then((value) =>
                              veiculo = Veiculo().fromMap(value))
                                  .whenComplete(() {
                                Navigator.of(context).pop();
                                veiculo.image = "https://www.crazyhappyfuntime.com/swimg/vehicles/${_list[index].replaceAll(RegExp(r'[^0-9]'), "")}/"
                                    "1.jpg";
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        VeiculoPage(veiculo)));
                              });
                            break;
                          case "planets":
                            Planeta planeta;
                            ConexaoApi()
                              ..carregarLink(_list[index])
                                  .then((value) =>
                              planeta = Planeta().fromMap(value))
                                  .whenComplete(() {
                                Navigator.of(context).pop();
                                planeta.image = "https://www.crazyhappyfuntime.com/swimg/planets/${_list[index].replaceAll(RegExp(r'[^0-9]'), "")}/"
                                    "1.jpg";
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PlanetPage(planeta)));
                              });
                            break;
                          case "species":
                            Especie especie;
                            ConexaoApi()
                              ..carregarLink(_list[index]).then((value) {
                                especie = Especie().fromMap(value);
                                ConexaoApi()
                                    .carregarLink(value["homeworld"])
                                    .then((planet) => especie.mundo =
                                    Planeta().fromMap(planet))
                                    .whenComplete(() {
                                  Navigator.of(context).pop();
                                  especie.image = "https://www.crazyhappyfuntime.com/swimg/species/${_list[index].replaceAll(RegExp(r'[^0-9]'), "")}/"
                                      "1.jpg";
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          SpeciePage(especie)));
                                });
                              });
                            break;
                        }
                        print(_list[index]);
                      },
                      child: _buildLink(_list[index], context, _title),
                    );
                  }),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildLink(request, context, title) {
    ConexaoApi api = ConexaoApi();
    return FutureBuilder(
        future: api.carregarLink(request),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 500.0,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  strokeWidth: 5.0,
                ),
              );
            default:
              if (snapshot.hasError)
                return Container();
              else
                return _build(snapshot.data, context, title, request);
          }
        });
  }

  Widget _build(request, context, title, link) {
    Map<String, dynamic> map = request;
    switch (title) {
      case "Residents":
      case "Characters":
      case "Peoples":
      case "Pilots":
        result = Result(map["name"], map["birth_year"],
            map["gender"].toString(), link, title.toString().toLowerCase());
        result.image = "https://starwars-visualguide.com/assets/img/characters/"
            "${result.link.replaceAll(RegExp(r'[^0-9]'), "")}.jpg";
        break;
      case "Films":
        result = Result(map["title"], map["director"],
            map["episode_id"].toString(), link, title.toString().toLowerCase());
        result.image = "https://starwars-visualguide.com/assets/img/films/"
            "${result.link.replaceAll(RegExp(r'[^0-9]'), "")}.jpg";
        break;
      case "Starships":
        result = Result(map["name"], map["starship_class"], map["model"], link,
            title.toString().toLowerCase());
        result.nave = Nave().fromMap(map);
        result.image = "https://www.crazyhappyfuntime.com/swimg/starships/${result.link.replaceAll(RegExp(r'[^0-9]'), "")}/"
            "1.jpg";
        break;
      case "Vehicles":
        result = Result(map["name"], map["vehicle_class"], map["model"], link,
            title.toString().toLowerCase());
        result.image = "https://www.crazyhappyfuntime.com/swimg/vehicles/${result.link.replaceAll(RegExp(r'[^0-9]'), "")}/"
            "1.jpg";
        break;
      case "Planets":
        result = Result(map["name"], map["climate"], map["terrain"], link,
            title.toString().toLowerCase());
        result.image = "https://www.crazyhappyfuntime.com/swimg/planets/${result.link.replaceAll(RegExp(r'[^0-9]'), "")}/"
            "1.jpg";
        break;
      case "Species":
        result = Result(map["name"], map["language"], map["classification"],
            link, title.toString().toLowerCase());
        result.image = "https://www.crazyhappyfuntime.com/swimg/species/${result.link.replaceAll(RegExp(r'[^0-9]'), "")}/"
            "1.jpg";
        break;
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.blue.withOpacity(0.1),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.network(
                result.image,
                fit: BoxFit.fill,
              ),
            ),
            Flexible(
              child: Card(
                color: Colors.white.withAlpha(50),
                child: ListTile(
                  title: Text(
                    result.titulo,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    result.subtitulo,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w100),
                  ),
//                  trailing: Padding(padding: EdgeInsets.only(bottom: 40, left: 10),
//                    child: Text(result.trailing, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),),
                ),
              ),
            )
          ],
        ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class Result {
  String titulo, subtitulo, trailing, link, type, image;
  Nave nave;
  Filme film;
  Veiculo veiculo;

  Result(this.titulo, this.subtitulo, this.trailing, this.link, this.type);
}