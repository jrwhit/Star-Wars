import 'package:star_wars/model/planeta.dart';
import 'package:star_wars/model/veiculo.dart';

import 'Pessoa.dart';
import 'especie.dart';
import 'nave.dart';

class Filme{
  String dataLancamento, producao, diretor, abertura, epId, titulo;
  List<Especie> listEspecie;
  List<Veiculo> listVeiculo;
  List<Pessoa> listPessoa;
  List<Nave> listNave;
  List<Planeta> listPlanetas;

  Filme({this.dataLancamento, this.producao, this.diretor, this.abertura, this.epId,
  this.titulo, this. listEspecie, this.listVeiculo, this.listNave, this.listPessoa,
  this.listPlanetas});

  Filme fromMap(Map<String, dynamic> map){
    return Filme(
      abertura: map["opening_crawl"] != null ? map["opening_crawl"] : null,
      dataLancamento: map["release_date"] != null ? map["release_date"] : null,
      diretor: map["director"] != null ? map["director"] : null,
      epId: map["episode_id"] != null ? map["episode_id"] : null,
      producao: map["producer"] != null ? map["producer"] : null,
      titulo: map["title"] != null ? map["title"] : null,
      listEspecie: map["species"] != null ? List.castFrom(map["species"]) : null,
      listNave: map["starships"] != null ? List.castFrom(map["starships"]):null,
      listPessoa: map["characters"]!= null ? List.castFrom(map["characters"]): null,
      listVeiculo: map["vehicles"] != null ? List.castFrom(map["vehicles"]):null,
      listPlanetas: map["planets"] != null ? List.castFrom(map["planets"]):null
    );
  }
}