// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planeta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Planeta _$PlanetaFromJson(Map<String, dynamic> json) {
  return Planeta(
    nome: json['nome'] as String,
    rotPeriodo: json['rotPeriodo'] as String,
    orbPeriodo: json['orbPeriodo'] as String,
    diametro: json['diametro'] as String,
    clima: json['clima'] as String,
    gravidade: json['gravidade'] as String,
    terreno: json['terreno'] as String,
    agua: json['agua'] as String,
    populacao: json['populacao'] as String,
    listPessoas:
        (json['listPessoas'] as List)?.map((e) => e as String)?.toList(),
    listFilmes: (json['listFilmes'] as List)?.map((e) => e as String)?.toList(),
  )..image = json['image'] as String;
}

Map<String, dynamic> _$PlanetaToJson(Planeta instance) => <String, dynamic>{
      'nome': instance.nome,
      'rotPeriodo': instance.rotPeriodo,
      'orbPeriodo': instance.orbPeriodo,
      'diametro': instance.diametro,
      'clima': instance.clima,
      'gravidade': instance.gravidade,
      'terreno': instance.terreno,
      'agua': instance.agua,
      'populacao': instance.populacao,
      'image': instance.image,
      'listPessoas': instance.listPessoas,
      'listFilmes': instance.listFilmes,
    };
