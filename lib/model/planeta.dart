import 'package:json_annotation/json_annotation.dart';

part 'planeta.g.dart';

@JsonSerializable()
class Planeta{
  String nome, rotPeriodo, orbPeriodo, diametro, clima, gravidade, terreno,
  agua, populacao, image;
  List<String> listPessoas;
  List<String> listFilmes;

  Planeta({
    this.nome, this.rotPeriodo,this.orbPeriodo,this.diametro,this.clima,
    this.gravidade,this.terreno,this.agua,this.populacao,this.listPessoas,
    this.listFilmes});

  factory Planeta.fromJson(Map<String, dynamic> json)=>
      _$PlanetaFromJson(json);

  Map<String, dynamic> toJson()=> _$PlanetaToJson(this);
}