import 'package:dio/dio.dart';
import 'package:star_wars/service/rotas.dart';

class ConexaoApi {
  Dio dio = Dio();
  Rotas _request = Rotas();
  Response response;
  FormData formData;
  Map<String, dynamic> map;

  Future carregarPessoas<Map>()async{
    try{
      response = await dio.get(_request.getPeople());
      print("retorno pessoas ${response.data}");
      return response.data;
    }catch(e){
      print(e);
    }
  }
  Future carregarByNome<Map>(String nome)async{
    try{
      response = await dio.get(_request.getByNome()+nome);
      print("retorno pessoas ${response.data}");
      return response.data;
    }catch(e){
      print(e);
    }
  }
  Future carregarLink<Map>(String rota)async{
    try{
      response = await dio.get(rota);
      print("retorno link ${response.data}");
      return response.data;
    }catch(e){
      print(e);
    }
  }
}