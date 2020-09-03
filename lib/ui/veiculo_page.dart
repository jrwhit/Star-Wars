import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/veiculo.dart';
import 'package:star_wars/widget/list_detalhes.dart';

class VeiculoPage extends StatelessWidget {
  VeiculoPage(this.veiculo);
  final Veiculo veiculo;

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    var themeText = Theme.of(context).textTheme;
    return SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/images/background/ceu.png"))),
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
                          Image.asset("asset/images/etc/r2d2.png"),
                          Text(veiculo.nome, style: themeText.caption.copyWith(color: Colors.white, fontSize: 20),),
                          Text(veiculo.capacidade, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16),),
                          Text(veiculo.classe, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16),),
                          Text(veiculo.custo, style: themeText.headline2.copyWith(color: Colors.yellowAccent, fontSize: 16),),
                          Text(veiculo.modelo, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16),),
                          Text(veiculo.passageiros, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                          Text(veiculo.consumables, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                          Text(veiculo.crew, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                          Text(veiculo.speed, style: themeText.headline2.copyWith(color: Colors.white, fontSize: 16,), textAlign: TextAlign.center,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            child: Container(
                              width: sizeW * 0.6,
                              child: ListResult(veiculo.pilotos, "Pilotos"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                            child: Container(
                              width: sizeW * 0.6,
                              child: ListResult(veiculo.filmes, "Filmes"),
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
