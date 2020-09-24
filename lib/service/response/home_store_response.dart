import 'package:json_annotation/json_annotation.dart';
import 'package:star_wars/model/base.dart';
import 'package:star_wars/model/pessoa.dart';

part 'home_store_response.g.dart';

@JsonSerializable()
class HomeStoreResponse extends Base<List<People>> {
  HomeStoreResponse(
      int count, String next, String previous, List<People> results)
      : super(count, next, previous, results);

  factory HomeStoreResponse.fromJson(Map<String, dynamic> json)=>
      _$HomeStoreResponseFromJson(json);

  Map<String, dynamic> tojson()=> _$HomeStoreResponseToJson(this);
}
