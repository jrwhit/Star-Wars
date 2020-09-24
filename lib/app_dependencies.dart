import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:star_wars/service/home_api.dart';

import 'resources/dio_logging_interceptor.dart';

Dio initializeDio(){
  var dio = Dio();

  dio.options.connectTimeout = 60000;
  dio.options.receiveTimeout = 60000;
  dio.interceptors.add(LoggingInterceptors());

  return dio;
}

final List<SingleChildWidget> providers = [
  Provider(create: (_)=> initializeDio(),),
  ...apiProviders,
  ProxyProvider(
      update: (context, navigationKey, _){
        return NavigationServiceImpl(
          navigationKey: navigationKey
        );
      }
  )
];

final List<SingleChildWidget> apiProviders = [
  ProxyProvider(
    update: (
    context, Dio dio, _
    ){
      return HomeApi(dio);
    },
  )
];