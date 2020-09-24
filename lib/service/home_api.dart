import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:star_wars/service/response/home_store_response.dart';
import '../constant.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class HomeApi{
  factory HomeApi(Dio dio, {String baseUrl}) = _HomeApi;

  @GET("people")
  Future<HomeStoreResponse> fetchHomeStores();
}