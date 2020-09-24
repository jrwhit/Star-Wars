import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/model/pessoa.dart';
import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/service/conexao.dart';
import 'package:star_wars/service/rotas.dart';
import 'package:star_wars/ui/page_result_search.dart';
import 'package:star_wars/ui/people_page.dart';
import 'package:star_wars/util/constantes.dart';
import 'package:star_wars/widget/carousel_home.dart';
import 'package:star_wars/widget/lazy_loading_teste.dart';
import 'package:star_wars/widget/loading.dart';

import '../store/store_pesquisa.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FocusNode focus;
  PesquisaStore store;
  ConexaoApi api;
//  Future cPeoples, cNaves, cFilmes, cVeiculos;
  bool loading;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
//    cPeoples = api.carregarPessoas();
//    cFilmes = api.carregarFilmes();
//    cNaves = api.carregarNaves();
//    cVeiculos = api.carregarVeiculos();
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

  _loading(image, texto, {widget}){
    showDialog(
        barrierDismissible: false,
        context: this.context,
        builder: (_) => Dialog(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                )
            ),
            alignment: FractionalOffset.center,
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.2,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(texto, style: TextStyle(color: Colors.white),),
                ),
                widget,
              ],
            ),
          ),
        ));
  }

  void _onSubmitted<Map>(String query) {
    _loading("assets/images/loading.gif","",widget: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      strokeWidth: 5.0,
    ));
    if (query.toString().isEmpty) {
      Navigator.of(context).pop();
    } else if (query.toString().isNotEmpty) {
      People pessoa;
      ConexaoApi()
        ..carregarByNome(query)
            .then((value) async {
          if(value["results"].isEmpty){
            Navigator.of(this.context).pop();
            _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                    content: Text("Digite o nome de um personagem",
                    ))
            );
          }else if(value["results"].length>1){
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(
                builder: (context) =>
                    ResultSearch(value, query)));
          }else{

              pessoa = People().fromMap(value["results"][0]);
              pessoa.image = "https://starwars-visualguide.com/assets/img/characters/"
                  "${value['results'][0]['url'].replaceAll(RegExp(r'[^0-9]'), "")}.jpg";
              ConexaoApi()
                  .carregarLink(value["results"][0]["homeworld"])
                  .then((planet) => pessoa.planeta = Planeta().fromMap(planet))
                  .whenComplete((){
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(
                    builder: (context) =>
                        PeoplePage(pessoa)));
              });
          }
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
                  image: AssetImage("assets/images/home.jpg"),
                  fit: BoxFit.fill)
          ),
          child: SafeArea(
              child: Scaffold(
                key: _scaffoldKey,
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
                                      hintText: "Digite o nome de um personagem",
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
                          LazyLoading("Peoples", Rotas().getPeople()),
                          LazyLoading("Films", Rotas().getFilms()),
                          LazyLoading("Starships", Rotas().getStarships()),
                          LazyLoading("Vehicles", Rotas().getVehicles()),
//                          Carousel(cPeoples, sW, "Peoples"),
//                          Carousel(cFilmes, sW, "Films"),
//                          Carousel(cNaves, sW, "Starships"),
//                          Carousel(cVeiculos, sW, "Vehicles"),
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

/*
* 889597033935-26lot9opbmg276lhu31g73ablct6rvdm.apps.googleusercontent.com*/
/*google search api: AIzaSyBdNXOihcWDODmOwDVjlvJZJ81kvZBucvA*/
/*serach id: 85b23a522ef724a5d*/


/*
* https://www.googleapis.com/customsearch/v1?key=AIzaSyBdNXOihcWDODmOwDVjlvJZJ81kvZBucvA&cx=85b23a522ef724a5d&q=flower&searchType=image&fileType=png&imgSize=small&alt=json*/