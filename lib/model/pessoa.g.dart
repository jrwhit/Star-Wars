// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

People _$PeopleFromJson(Map<String, dynamic> json) {
  return People(
    nome: json['nome'] as String,
    altura: json['altura'] as String,
    peso: json['peso'] as String,
    corCabelo: json['corCabelo'] as String,
    corPele: json['corPele'] as String,
    corOlho: json['corOlho'] as String,
    aniversario: json['aniversario'] as String,
    genero: json['genero'] as String,
    filmes: (json['filmes'] as List)?.map((e) => e as String)?.toList(),
    naves: (json['naves'] as List)?.map((e) => e as String)?.toList(),
    veiculos: (json['veiculos'] as List)?.map((e) => e as String)?.toList(),
    image: json['image'] as String,
    planeta: json['planeta'] == null
        ? null
        : Planeta.fromJson(json['planeta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PeopleToJson(People instance) => <String, dynamic>{
      'nome': instance.nome,
      'altura': instance.altura,
      'peso': instance.peso,
      'corCabelo': instance.corCabelo,
      'corPele': instance.corPele,
      'corOlho': instance.corOlho,
      'aniversario': instance.aniversario,
      'genero': instance.genero,
      'image': instance.image,
      'filmes': instance.filmes,
      'naves': instance.naves,
      'veiculos': instance.veiculos,
      'planeta': instance.planeta,
    };
