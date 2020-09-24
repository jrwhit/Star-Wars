import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/model/veiculo.dart';
import 'package:star_wars/service/conexao.dart';

import 'pessoa.dart';
import 'especie.dart';
import 'nave.dart';

class Filme{
  String dataLancamento, producao, diretor, abertura, epId, titulo, image;
  List<String> listEspecie;
  List<String> listVeiculo;
  List<String> listPessoa;
  List<String> listNave;
  List<String> listPlanetas;

  Filme({this.dataLancamento, this.producao, this.diretor, this.abertura, this.epId,
  this.titulo, this. listEspecie, this.listVeiculo, this.listNave, this.listPessoa,
  this.listPlanetas});

  Filme fromMap(Map<String, dynamic> map){
//    List<Especie> lE = List<Especie>();
//    ConexaoApi()..carregarLink(map["species"]).then((value){
//      for(int i=0; i<value.length;i++){
//        lE.add(Especie().fromMap(value[index]));
//      }
//    });
    Filme filme = Filme(
        abertura: map["opening_crawl"],
        dataLancamento: map["release_date"],
        diretor: map["director"],
        epId: map["episode_id"].toString(),
        producao: map["producer"],
        titulo: map["title"],
        listEspecie: List.castFrom(map["species"]),
        listNave: List.castFrom(map["starships"]),
        listPessoa: List.castFrom(map["characters"]),
        listVeiculo: List.castFrom(map["vehicles"]),
        listPlanetas: List.castFrom(map["planets"])
    );
    return filme;
  }
}