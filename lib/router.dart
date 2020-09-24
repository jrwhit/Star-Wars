import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'resources/app_routes.dart' as AppRoutes;
import 'ui/home.dart';
import 'ui/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return createRoute(
        settings: settings,
        builder: (_) => MultiProvider(providers: [

        ],
        child: CrawlPage(),),
      );
    case AppRoutes.home:
      return createRoute(
        settings: settings,
        builder: (_)=> MultiProvider(
            providers: [

            ],
          child: Home(),
        )
      );
  }
}

Route createRoute<T>({RouteSettings settings, WidgetBuilder builder}) {
  return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return builder(context);
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        final curve = Curves.easeInOutSine;
        final enterAnimation =
            Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .chain(CurveTween(curve: curve))
                .animate(animation);
        final exitSlideAnimation = Tween<Offset>(
          begin: const Offset(0.0, 0.0),
          end: const Offset(-0.2, 0.0),
        ).chain(CurveTween(curve: curve)).animate(secondaryAnimation);

        final exitOpacityAnimation = Tween<double>(
          begin: 0.0,
          end: 0.7,
        ).chain(CurveTween(curve: curve)).animate(secondaryAnimation);

        return SlideTransition(
          position: enterAnimation,
          child: SlideTransition(
            position: exitSlideAnimation,
            child: Stack(
              children: [
                child,
                Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: IgnorePointer(
                      child: FadeTransition(
                        opacity: exitOpacityAnimation,
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        );
      });
}
