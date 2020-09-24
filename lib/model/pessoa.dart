import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars/model/planeta.dart';

part 'pessoa.g.dart';

@JsonSerializable()
class People{
  final String nome, altura, peso, corCabelo, corPele,
      corOlho, aniversario, genero, image;
  final List<String> filmes, naves, veiculos;
  final Planeta planeta;

  People({
    this.nome,
    this.altura,
    this.peso,
    this.corCabelo,
    this.corPele,
    this.corOlho,
    this.aniversario,
    this.genero,
    this.filmes,
    this.naves,
    this.veiculos,
    this.image,
    this.planeta
  });

  factory People.fromJson(Map<String, dynamic> json, {Map<String, dynamic> json2})=>
      _$PeopleFromJson(json);

  Map<String, dynamic> toJson()=> _$PeopleToJson(this);
}