import 'package:flutter/cupertino.dart';
import 'package:star_wars/framework/NavigationService.dart';
import 'package:star_wars/resources/app_routes.dart' as AppRoutes;

class NavigationServiceImpl implements NavigationService{
  NavigationServiceImpl({@required navigatorKey}): _navigatorKey = navigatorKey;
  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  void goBack() {
    // TODO: implement goBack
    _navigatorKey.currentState.pop();
  }
  @override
  void goBackAndRemoveUntil(List<String> routeNames) {
    // TODO: implement goBackAndRemoveUntil
    _navigatorKey.currentState.popUntil((route){
      for(var name in routeNames){
        if(name == route.settings.name) return true;
      }
      return false;
    });
  }

  @override
  void navigateToHome() {
    // TODO: implement navigateToHome
    _navigatorKey.currentState.pushNamed(
        AppRoutes.home);
  }
}