import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/nave.dart';
import 'package:star_wars/widget/list_detalhes.dart';

class NavePage extends StatelessWidget {
  NavePage(this.nave);
  final Nave nave;

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    var themeText = Theme.of(context).textTheme;
    return SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/ceu.png"))),
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
                          Text(nave.nome, style: themeText.caption.copyWith(color: Colors.white, fontSize: 20),),
                          Text(nave.velocidadeMax, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16),),
                          Text(nave.passageiros, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16),),
                          Text(nave.tamanho, style: themeText.headline2.copyWith(color: Colors.yellowAccent, fontSize: 16),),
                          Text(nave.modelo, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16),),
                          Text(nave.manufatura, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                          Text(nave.hyper, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                          Text(nave.eTecnica, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                          Text(nave.custo, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                          Text(nave.classe, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                          Text(nave.capacidade, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            child: Container(
                              width: sizeW * 0.6,
                              child: ListResult(nave.listFilm, "Filmes"),
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
