import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/Pessoa.dart';
import 'package:star_wars/service/conexao.dart';
import 'package:star_wars/ui/page_hero.dart';
import 'package:star_wars/util/constantes.dart';
import 'package:star_wars/widget/carousel_home.dart';

import '../store/store_pesquisa.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode focus;
  PesquisaStore store;
  ConexaoApi api;
  Future cPeoples;

  @override
  void initState() {
    focus = FocusNode();
    focus.addListener(() {
      setState(() {
        ///
      });
    });
    store = PesquisaStore();
    api = ConexaoApi();
    cPeoples = api.carregarPessoas();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    store.textSearch.dispose();
    focus.dispose();
    super.dispose();
  }

  void _onSubmitted<Map>(String query) {
    if (query.toString().isEmpty) {
      //
    } else if (query.toString().isNotEmpty) {
      Pessoa pessoa;
      ConexaoApi()
        ..carregarByNome(query)
            .then((value) {
          log("search: ${value}", name: "log search");
          pessoa = Pessoa().fromMap(value["results"][0]);
          pessoa.image = "asset/images/quinRetrato.png";
        }).whenComplete(() {
          log("Pesquisa concluida", name: "log pesquisa");
          Navigator.of(context).push(
              MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return PageHero(pessoa);
                  }
              )
          );
        }).catchError((e) => print(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var sH = MediaQuery.of(context).size.height;
    var sW = MediaQuery.of(context).size.width;
    return WillPopScope(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://themobilewallpaper.com/uploads/blog_images/Devices-iPhone-5-mobile-tablet-HD-Wallpaper-1593852393.jpg"),
            fit: BoxFit.fill)
          ),
          child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white.withOpacity(0.01),
                appBar: AppBar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  title: Text("Star Wars"),
                  elevation: 0,
//                leading: Image.asset("assets/images/logo.png"),
                  centerTitle: true,

                ),
                body: GestureDetector(
                  onTap: () {
                    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 20, right: 16, left: 16, bottom: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: sW * 0.9,
                                height: sH * 0.12,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: AssetImage("assets/images/lightsaber.png"), fit: BoxFit.cover)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: sW * 0.05,
                                      right: sW * 0.18),
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: focus.hasFocus
                                            ? STAR_ICON_COLOR_2
                                            : STAR_ICON_COLOR_3),
                                    focusNode: focus,
                                    maxLines: 1,
                                    maxLength: 120,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: "Digite aqui",
                                      labelStyle: TextStyle(color: Colors.blue[100]),
                                      hintStyle: TextStyle(color: Colors.indigo[50]),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hoverColor: Colors.black,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.circular(25)
                                          ),
                                          borderSide: BorderSide(
                                              color: STAR_ICON_COLOR_2,
                                              width: 2.0)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: STAR_ICON_COLOR_3,
                                              width: 2.0)),
                                      suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.search,
                                            color: focus.hasFocus
                                                ? STAR_ICON_COLOR_2
                                                : STAR_ICON_COLOR_3,
                                          ),
                                          onPressed: () {
                                            _onSubmitted(store.textSearch.text);
                                          }),
                                    ),
                                    onFieldSubmitted: _onSubmitted,
                                    controller: store.textSearch,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(),
                          Carousel(cPeoples, sW, "Jedis"),
                          Carousel(cPeoples, sW, "Filmes"),
                          Carousel(cPeoples, sW, "Naves"),
                          Carousel(cPeoples, sW, "Veículos"),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
        onWillPop: (){
          return showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Você tem certeza?"),
                  content: Text("Você sairá do aplicativo."),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text('Não'),
                    ),
                    new FlatButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: new Text('Sim'),
                    ),
                  ],
                );
              }
          ) ?? false;
        }
    );
  }
}