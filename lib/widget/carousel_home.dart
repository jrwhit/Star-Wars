import 'package:flutter/material.dart';
import 'package:star_wars/model/Pessoa.dart';
import 'package:star_wars/model/film.dart';
import 'package:star_wars/model/nave.dart';
import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/model/veiculo.dart';
import 'package:star_wars/service/conexao.dart';
import 'package:star_wars/ui/page_hero.dart';

import 'circleAvatar.dart';

class Carousel extends StatelessWidget {
  Carousel(this.future, this.sW, this.title);
  Future future;
  var sW;
  String title;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
                width: sW,
                height: 500.0,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor:
                  AlwaysStoppedAnimation<Color>(Colors.red),
                  strokeWidth: 5.0,
                ),
              );
            default:
              if (snapshot.hasError)
                return Container();
              else
                return _build(snapshot.data, context, title);
          }
        });
  }
  Widget _build(request, context, title) {
    Map<String, dynamic> map = request;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.03,
//                color: Colors.yellowAccent.withOpacity(0.1),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 6),
                child: Text(title,
                    style: Theme.of(context).textTheme.caption.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500, fontSize: 12)),
              )
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.24,
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.lightBlue.withOpacity(0.1),
            child: ListView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: map['results'].length,
                itemBuilder: (context, int index) {
                  var pessoa = Pessoa().fromMap(map['results'][index]);
                  pessoa.image = "assets/images/quinRetrato.png";
                  return GestureDetector(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TileResult(
                        pessoa: pessoa,
                      ),
                    ),
                    onTap: (){
                      ConexaoApi()..carregarLink(map["results"][index]["homeworld"])
                          .then((value) => pessoa.planeta = Planeta().fromMap(value))
                          .whenComplete(() => Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return PageHero(pessoa);
                              }
                          )
                      ));
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
