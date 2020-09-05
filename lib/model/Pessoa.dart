import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/service/conexao.dart';

class Pessoa{
  String nome, altura, peso, corCabelo, corPele,
      corOlho, aniversario, genero, image;
  List<String> filmes, naves, veiculos;
  Planeta planeta;

  Pessoa({this.nome, this.altura, this.peso, this.corCabelo, this.corPele,
    this.corOlho, this.aniversario, this.genero, this.filmes, this.naves,
    this.veiculos, this.image, this.planeta});

  Pessoa fromMap(Map<String, dynamic> map, {Map<String, dynamic> map2}){
    Pessoa pessoa =
    Pessoa(
        nome: map["name"] != null ? map["name"] : " ",
        altura: map["height"] != null ? map["height"] : " ",
        peso: map["mass"] != null ? map["mass"] : " ",
        corCabelo: map["hair_color"] != null ? map["hair_color"] : " ",
        corPele: map["skin_color"] != null ? map["skin_color"] : " ",
        corOlho: map["eye_color"] != null ? map["eye_color"] : " ",
        aniversario: map["birth_year"] != null ? map["birth_year"] : " ",
        genero: map["gender"] != null ? map["gender"] : " ",
        filmes: map["films"] != null ? List.castFrom(map["films"]) : null,
        naves: map["starships"] != null ? List.castFrom(map["starships"]):null,
        veiculos: map["vehicles"] != null ? List.castFrom(map["vehicles"]):null,
    );
    return pessoa;
  }
}