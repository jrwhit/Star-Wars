import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:star_wars/model/film.dart';
import 'package:star_wars/model/nave.dart';
import 'package:star_wars/model/veiculo.dart';
import 'package:star_wars/service/conexao.dart';
import 'package:star_wars/ui/filme_page.dart';
import 'package:star_wars/ui/nave_page.dart';
import 'package:star_wars/ui/veiculo_page.dart';

class ListResult extends StatelessWidget {
  ListResult(this._list, this._title);
  List<String> _list;
  String _title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          _title,
          style: TextStyle(
              color: Colors.yellowAccent, fontWeight: FontWeight.w600),
        ),
        ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  switch(_title){
                    case "Filmes":
                      Filme filme;
                      ConexaoApi()
                        ..carregarLink(_list[index]).then((value) {
                          filme = Filme().fromMap(value);
                        }).whenComplete(() => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PageFilm(filme))));
                      break;
                    case "Naves":
                      Nave nave;
                      ConexaoApi()
                        ..carregarLink(_list[index]).then((value) {
                          nave = Nave().fromMap(value);
                        }).whenComplete(() => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => NavePage(nave))));
                      break;
                    case "Veículos":
                      Veiculo veiculo;
                      ConexaoApi()
                        ..carregarLink(_list[index]).then((value) {
                          veiculo = Veiculo().fromMap(value);
                        }).whenComplete(() => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => VeiculoPage(veiculo))));
                      break;
                  }
                },
                child: Text(
                  _list[index],
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              );
            })
      ],
    );
  }
}
