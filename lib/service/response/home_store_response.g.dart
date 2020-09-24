// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeStoreResponse _$HomeStoreResponseFromJson(Map<String, dynamic> json) {
  return HomeStoreResponse(
    json['count'] as int,
    json['next'] as String,
    json['previous'] as String,
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : People.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomeStoreResponseToJson(HomeStoreResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
