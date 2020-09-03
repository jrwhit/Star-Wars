import 'package:star_wars/model/Pessoa.dart';
import 'package:star_wars/model/film.dart';

class Planeta{
  String nome, rotPeriodo, orbPeriodo, diametro, clima, gravidade, terreno,
  agua, populacao;
  List<Pessoa> listPessoas;
  List<Filme> listFilmes;

  Planeta({
    this.nome, this.rotPeriodo,this.orbPeriodo,this.diametro,this.clima,
    this.gravidade,this.terreno,this.agua,this.populacao,this.listPessoas,
    this.listFilmes});

  Planeta fromMap(Map<String, dynamic> map){
    return Planeta(
      nome: map["name"], agua: map["surface_water"], diametro: map["diameter"],
      clima: map["climate"], gravidade: map["gravity"], orbPeriodo: map["orbital_period"],
      rotPeriodo: map["rotation_period"], terreno: map["terrain"], populacao: map["population"],
      listPessoas: List.castFrom(map["residents"]),
        listFilmes: List.castFrom(map["films"])
    );
  }
}
//"name": "Tatooine",
//"rotation_period": "23",
//"orbital_period": "304",
//"diameter": "10465",
//"climate": "arid",
//"gravity": "1 standard",
//"terrain": "desert",
//"surface_water": "1",
//"population": "200000",
//"residents": [
//"http://swapi.dev/api/people/1/",
//"http://swapi.dev/api/people/2/",
//"http://swapi.dev/api/people/4/",
//"http://swapi.dev/api/people/6/",
//"http://swapi.dev/api/people/7/",
//"http://swapi.dev/api/people/8/",
//"http://swapi.dev/api/people/9/",
//"http://swapi.dev/api/people/11/",
//"http://swapi.dev/api/people/43/",
//"http://swapi.dev/api/people/62/"
//],
//"films": [
//"http://swapi.dev/api/films/1/",
//"http://swapi.dev/api/films/3/",
//"http://swapi.dev/api/films/4/",
//"http://swapi.dev/api/films/5/",
//"http://swapi.dev/api/films/6/"
//],