import 'package:flutter/material.dart';
import 'package:goldy_app/core/presentation/home_screen.dart';
import 'package:goldy_app/core/routing/routes.dart';

abstract class AppRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    switch (settings.name) {

      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          }
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'No routes defined for ${settings.name}'
              ),
            ),
          ),
        );
    }
  }
}