import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/veiculo.dart';
import 'package:star_wars/widget/list_detalhes.dart';

class VeiculoPage extends StatelessWidget {
  VeiculoPage(this.veiculo);
  final Veiculo veiculo;

  Widget paragraph(style, text, text2, colorFont) {
    return RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            style: style.headline2.copyWith(
                color: colorFont, fontSize: 16.0, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: text,
              ),
              TextSpan(
                text: text2,
              ),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    var sizeW = MediaQuery.of(context).size.width;
    var sizeH = MediaQuery.of(context).size.height;
    var themeText = Theme.of(context).textTheme;
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/ceu.png"))),
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
                        "Vehicle",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Stack(
                  children: <Widget>[
                    Image(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        image: NetworkImage(
                          "https://vignette.wikia.nocookie.net/starwars/images/2/27/Rebel_snowspeeder_SWL.png/revision/latest?cb=20190515060930",
                        )),
                    Text(
                      veiculo.nome,
                      style: themeText.caption.copyWith(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: sizeH * 0.05, horizontal: sizeW * 0.1),
                child: Container(
                  width: sizeW,
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                  color: Colors.white.withOpacity(0.1),
                  child: Column(
                    children: <Widget>[
                      Table(
                        columnWidths: {2: FractionColumnWidth(.3)},
                        children: [
                          TableRow(children: [
                            paragraph(themeText, "Cost: ", veiculo.custo,
                                Colors.white),
                            paragraph(themeText, "Model: ", veiculo.modelo,
                                Colors.white),
                          ]),
                          TableRow(children: [
                            paragraph(themeText, "Passengers: ",
                                veiculo.passageiros, Colors.white),
                            paragraph(themeText, "Consumables: ",
                                veiculo.consumables, Colors.white),
                          ]),
                          TableRow(children: [
                            paragraph(themeText, "Crew: ", veiculo.crew,
                                Colors.white),
                            paragraph(themeText, "Speed: ", veiculo.speed,
                                Colors.white),
                          ]),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Container(
                          width: sizeW * 0.6,
                          child: ListResult(veiculo.pilotos, "Pilots"),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Container(
                          width: sizeW * 0.6,
                          child: ListResult(veiculo.filmes, "Films"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
