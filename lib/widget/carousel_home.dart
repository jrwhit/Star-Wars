import 'package:flutter/material.dart';
import 'package:star_wars/model/Pessoa.dart';
import 'package:star_wars/model/film.dart';
import 'package:star_wars/model/nave.dart';
import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/model/veiculo.dart';
import 'package:star_wars/service/conexao.dart';
import 'package:star_wars/ui/people_page.dart';

import 'circleAvatar.dart';

class Carousel extends StatelessWidget {
  Carousel(this.future, this.sW, this.title);
  Future future;
  var sW;
  String title;
  Result result;

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
    var sH = MediaQuery.of(context).size.height;
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
                  switch (title) {
                    case "Peoples":
                      result = Result(map['results'][index]["name"],
                          map['results'][index]["birth_year"],
                          map['results'][index]["gender"].toString(),
                          map['results'][index]["url"], title.toString().toLowerCase());
                      break;
                    case "Films":
                      result = Result(map['results'][index]["title"],
                          map['results'][index]["director"],
                          map['results'][index]["episode_id"].toString(),
                          map['results'][index]["url"], title.toString().toLowerCase());
                      break;
                    case "Starships":
                      result = Result(map['results'][index]["name"],
                          map['results'][index]["starship_class"],
                          map['results'][index]["model"],
                          map['results'][index]["url"],
                          title.toString().toLowerCase());
                      result.nave = Nave().fromMap(map);
                      break;
                    case "Vehicles":
                      result = Result(map['results'][index]["name"],
                          map['results'][index]["vehicle_class"],
                          map['results'][index]["model"],
                          map['results'][index]["url"],
                          title.toString().toLowerCase());
                      break;
                  }
//                  var pessoa = Pessoa().fromMap(map['results'][index]);
                  result.image = "assets/images/quinRetrato.png";
                  return GestureDetector(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: sH * .09,
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
                    onTap: (){
//                      showDialog(
//                          barrierDismissible: false,
//                          context: context,
//                          builder: (_) => new Dialog(
//                            child: new Container(
//                              decoration: BoxDecoration(
//                                image: DecorationImage(
//                                  image: AssetImage("assets/images/loading.gif"),
//                                  fit: BoxFit.cover
//                                )
//                              ),
//                              alignment: FractionalOffset.center,
//                              height: sW * 0.5,
//                              width: sW * 0.2,
//                              padding: const EdgeInsets.all(20.0),
//                              child: new Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: [
//                                  new Padding(
//                                    padding: new EdgeInsets.only(left: 10.0),
//                                    child: new Text("Loading", style: TextStyle(color: Colors.white),),
//                                  ),
//                                  new CircularProgressIndicator(),
//                                ],
//                              ),
//                            ),
//                          ));
//                      ConexaoApi()..carregarLink(map["results"][index]["homeworld"])
//                          .then((value) => pessoa.planeta = Planeta().fromMap(value))
//                          .whenComplete((){
//                            Navigator.of(context).pop();
//                        Navigator.of(context).push(
//                            MaterialPageRoute<void>(
//                                builder: (BuildContext context) {
//                                  return PageHero(pessoa);
//                                }
//                            )
//                        );
//                      });
                    },
                  );
                }),
          )
        ],
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
