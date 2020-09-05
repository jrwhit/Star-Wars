import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/Pessoa.dart';
import 'package:star_wars/model/film.dart';
import 'package:star_wars/model/nave.dart';
import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/model/veiculo.dart';
import 'package:star_wars/service/conexao.dart';
import 'package:star_wars/ui/filme_page.dart';
import 'package:star_wars/ui/nave_page.dart';
import 'package:star_wars/ui/page_hero.dart';
import 'package:star_wars/ui/veiculo_page.dart';

class ListResult extends StatelessWidget {
  ListResult(this._list, this._title);
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
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  reverse: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        switch (result.type) {
                          case "characters":
                          case "pilots":
                            Pessoa pessoa;
                            ConexaoApi()
                              ..carregarLink(_list[index]).then((value) {
                                pessoa = Pessoa().fromMap(value);
                                pessoa.image = "assets/images/quinRetrato.png";
                                ConexaoApi()
                                    .carregarLink(value["homeworld"])
                                    .then((planet) => pessoa.planeta = Planeta().fromMap(planet))
                                    .whenComplete(() => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) =>
                                                PageHero(pessoa))));
                              });
                            break;
                          case "starships":
                            Nave nave;
                            ConexaoApi()
                              ..carregarLink(_list[index])
                                  .then((value) => nave = Nave().fromMap(value))
                                  .whenComplete(() => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (context) =>
                                              NavePage(nave))));
                            break;
                          case "films":
                            Filme filme;
                            ConexaoApi()
                              ..carregarLink(_list[index])
                                  .then(
                                      (value) => filme = Filme().fromMap(value))
                                  .whenComplete(() => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (context) =>
                                              PageFilm(filme))));
                            break;
                          case "vehicles":
                            Veiculo veiculo;
                            ConexaoApi()
                              ..carregarLink(_list[index])
                                  .then((value) =>
                                      veiculo = Veiculo().fromMap(value))
                                  .whenComplete(() => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (context) =>
                                              VeiculoPage(veiculo))));
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
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
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
      case "Characters":
      case "Pilots":
        result = Result(map["name"], map["birth_year"],
            map["gender"].toString(), link, title.toString().toLowerCase());
        break;
      case "Films":
        result = Result(map["title"], map["director"],
            map["episode_id"].toString(), link, title.toString().toLowerCase());
        break;
      case "Starships":
        result = Result(map["name"], map["starship_class"], map["model"], link,
            title.toString().toLowerCase());
        result.nave = Nave().fromMap(map);
        break;
      case "Vehicles":
        result = Result(map["name"], map["vehicle_class"], map["model"], link,
            title.toString().toLowerCase());
        break;
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      height: 50,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        width: 100,
        height: 100,
        color: Colors.blue.withOpacity(0.1),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.network(
                "https://img2.wikia.nocookie.net/__cb20100915165213/starwars/images/8/84/QuiGonJinn-SWSB.png",
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
      ),
    );
  }
  //film:title, dataLancamento, diretor
  //nave:nome, modelo, class
  //veiculo:nome, modelo, class
}

class Result {
  String titulo, subtitulo, trailing, link, type;
  Nave nave;
  Filme film;
  Veiculo veiculo;
  Result(this.titulo, this.subtitulo, this.trailing, this.link, this.type);
}
