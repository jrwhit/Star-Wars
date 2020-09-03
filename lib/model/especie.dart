import 'package:star_wars/model/Pessoa.dart';
import 'package:star_wars/model/film.dart';

class Especie{
  String nome, classificacao, designacao,
      altMedia, corP, corC, corO, vidaM, mundo, linguagem;
  List<Pessoa> listPessoas;
  List<Filme> listFilm;

  Especie({this.nome, this.altMedia, this.classificacao, this.corC, this.corO,
    this.corP, this.designacao, this.linguagem, this.listFilm,
    this.listPessoas, this.mundo, this.vidaM});

  Especie fromMap(Map<String, dynamic> map){
    return Especie(
      nome: map["name"], altMedia: map["average_height"],
      classificacao: map["classification"], designacao: map["designation"],
      corC: map["hair_colors"], corP: map["skin_colors"], corO: map["eye_colors"],
      linguagem: map["language"], mundo: map["homeworld"], vidaM: map["average_lifespan"],
      listFilm: List.castFrom(map["films"]), listPessoas: List.castFrom(map["people"])
    );
  }
}