import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/pessoa.dart';
import 'package:star_wars/model/film.dart';
import 'package:star_wars/model/nave.dart';
import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/model/veiculo.dart';
import 'package:star_wars/service/conexao.dart';
import 'package:star_wars/ui/people_page.dart';

class ResultSearch extends StatefulWidget {
  ResultSearch(this.map, this.title);
  Map<String, dynamic> map;
  String title;

  @override
  _ResultSearchState createState() => _ResultSearchState(map, title);
}

class _ResultSearchState extends State<ResultSearch>
    with AutomaticKeepAliveClientMixin {
  _ResultSearchState(this.map, this.title);
  Map<String, dynamic> map;
  Result result;
  String title;

  int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  final dio = new Dio();
  bool fimList = false;

  @override
  void initState() {
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _sc.dispose();
    super.dispose();
  }

  void _getMoreData(int index) async {
    if (map["next"] == null) {
    } else if (fimList) {
//
    } else {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        var url = map['next'];
        print(url);
        final response = await dio.get(url);
        Map<String, dynamic> tMap = new Map<String, dynamic>();
        for (int i = 0; i < response.data['results'].length; i++) {
          tMap.addAll(response.data);
        }
        if (response.data['next'] == null) {
          setState(() {
            isLoading = false;
            map.update("next", (value) => tMap['next']);
            map['results'].addAll(tMap['results']);
            fimList = true;
          });
        } else {
          setState(() {
            isLoading = false;
            map.update("next", (value) => tMap['next']);
            map['results'].addAll(tMap['results']);
            page++;
            log("$map", name: "olha eu aqui");
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/ceu.png"), fit: BoxFit.fill)),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.01),
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.1),
          title: Text(title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                controller: _sc,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemExtent: MediaQuery.of(context).size.width * 0.6,
                scrollDirection: Axis.vertical,
                itemCount: map["results"].length + 1,
                itemBuilder: (context, index) {
                  if (index == map['results'].length) {
                    return _buildProgressIndicator();
                  } else {
                    return GestureDetector(
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
                                    height:
                                        MediaQuery.of(context).size.width * 0.5,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    padding: EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            " ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.red),
                                          strokeWidth: 5.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                        People pessoa;
                        ConexaoApi()
                          ..carregarLink(map['results'][index]['url'])
                              .then((value) {
                            pessoa = People().fromMap(value);
                            pessoa.image =
                                "https://starwars-visualguide.com/assets/img/characters/"
                                "${map["results"][index]['url'].replaceAll(RegExp(r'[^0-9]'), "")}.jpg";
                            ConexaoApi()
                                .carregarLink(value["homeworld"])
                                .then((planet) =>
                                    pessoa.planeta = Planeta().fromMap(planet))
                                .whenComplete(() {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PeoplePage(pessoa)));
                            });
                          });
                      },
                      child: _buildLink(map["results"][index], context),
                    );
                  }
                }),
          ),
        ),
      )),
    );
  }

  Widget _buildLink(request, context) {
    Map<String, dynamic> map = request;
    result = Result(
        map["name"], map["birth_year"], map["gender"].toString(), map['url']);
    result.image = "https://starwars-visualguide.com/assets/img/characters/"
        "${result.link.replaceAll(RegExp(r'[^0-9]'), "")}.jpg";
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      color: Colors.blue.withOpacity(0.1),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
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

  Widget _build(request, context, link) {
    Map<String, dynamic> map = request;
    result =
        Result(map["name"], map["birth_year"], map["gender"].toString(), link);
    result.image = "https://starwars-visualguide.com/assets/img/characters/"
        "${result.link.replaceAll(RegExp(r'[^0-9]'), "")}.jpg";
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class Result {
  String titulo, subtitulo, trailing, link, image;
  Nave nave;
  Filme film;
  Veiculo veiculo;

  Result(this.titulo, this.subtitulo, this.trailing, this.link);
}
