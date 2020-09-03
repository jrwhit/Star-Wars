import 'package:star_wars/model/film.dart';

class Nave{
  String nome, modelo, manufatura, custo, tamanho, velocidadeMax, eTecnica,
  passageiros, capacidade, consumo, hyper, mglt, classe;
  List<String> listFilm;

  Nave({this.listFilm, this.nome, this.capacidade, this.classe, this.consumo,
    this.custo, this.eTecnica, this.hyper, this.manufatura, this.mglt,
    this.modelo, this.passageiros, this.tamanho, this.velocidadeMax});

  Nave fromMap(Map<String, dynamic> map){
    return Nave(listFilm: List.castFrom(map["films"]),
        nome: map["name"], capacidade: map["cargo_capacity"],
        classe: map["starship_class"], consumo: map["consumables"], custo: map["cost_in_credits"],
        eTecnica: map["crew"], hyper: map["hyperdrive_rating"], manufatura: map["manufacturer"],
        mglt: map["MGLT"], modelo: map["model"], passageiros: map["passengers"],
        tamanho: map["length"], velocidadeMax: map["max_atmosphering_speed"]);
  }
}