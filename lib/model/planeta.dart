import 'package:star_wars/model/Pessoa.dart';
import 'package:star_wars/model/film.dart';

class Planeta{
  String nome, rotPeriodo, orbPeriodo, diametro, clima, gravidade, terreno,
  agua, populacao, image;
  List<String> listPessoas;
  List<String> listFilmes;

  Planeta({
    this.nome, this.rotPeriodo,this.orbPeriodo,this.diametro,this.clima,
    this.gravidade,this.terreno,this.agua,this.populacao,this.listPessoas,
    this.listFilmes});

  Planeta fromMap(Map<String, dynamic> map){
    return Planeta(
      nome: map["name"], agua: map["surface_water"], diametro: map["diameter"],
      clima: map["climate"], gravidade: map["gravity"], orbPeriodo: map["orbital_period"],
      rotPeriodo: map["rotation_period"], terreno: map["terrain"], populacao: map["population"],
      listPessoas: List.castFrom(map["residents"]), listFilmes: List.castFrom(map["films"])
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
//],
//"films": [
//],