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
}