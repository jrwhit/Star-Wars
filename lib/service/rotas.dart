class Rotas{
  final String _base = "https://swapi.dev/api/";
  String get baseUrl => _base;
  //root
  String getPeople()=> _base+"people/";
  String getByNome()=> _base+"people/?search=";
  String getFilms()=> _base+"films/";
  String getPlanets()=> _base+"planets/";
  String getSpecies()=> _base+"species/";
  String getStarships()=> _base+"starships/";
  String getVehicles()=> _base+"vehicles/";
}