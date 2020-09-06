import 'dart:io';

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


  @override
  _LazyLoadingState createState() => _LazyLoadingState();
}

class _LazyLoadingState extends State<LazyLoading> {

  static int page = 1;
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  List users = new List();
  final dio = new Dio();

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
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var url = "https://swapi.dev/api/species/?page=" +
          index.toString();
      print(url);
      final response = await dio.get(url);
      List tList = new List();
      if(!response.data.containsKey('results')){
        //
      }else{
        for (int i = 0; i < response.data['results'].length; i++) {
          tList.add(response.data['results'][i]);
        }
        setState(() {
          isLoading = false;
          users.addAll(tList);
          page++;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.24,
      color: Colors.blue.withOpacity(0.1),
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: users.length + 1, // Add one more item for progress indicator
      padding: EdgeInsets.symmetric(vertical: 8.0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        if (index == users.length) {
          return _buildProgressIndicator();
        } else {
          return Container(
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
                    users[index]['name'],
                    style: TextStyle(color: Colors.white),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          );
        }
      },
      controller: _sc,
    );
  }
  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
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
