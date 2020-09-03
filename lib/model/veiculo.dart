class Veiculo{
  String nome, modelo, manunfatura, custo, tamanho, speed, crew, passageiros,
  capacidade, consumables, classe;
  List<String> pilotos;
  List<String> filmes;

  Veiculo(
  {this.nome, this.modelo, this.manunfatura, this.custo, this.tamanho,
    this.speed, this.crew, this.passageiros, this.capacidade,
    this.consumables, this.classe, this.pilotos, this.filmes});

  Veiculo fromMap(Map<String, dynamic> map){
    Veiculo veiculo = Veiculo(
      nome: map["name"], modelo: map["model"], manunfatura: map["manufacturer"],
      custo: map["cost_in_credits"], tamanho: map["length"], speed: map["max_atmosphering_speed"],
      crew: map["crew"],passageiros: map["passengers"], capacidade: map["cargo_capacity"],
      classe: map["vehicle_class"], consumables: map["consumables"],
      filmes: List.castFrom(map["films"]), pilotos: List.castFrom(map["pilots"])
    );
    return veiculo;
  }
}