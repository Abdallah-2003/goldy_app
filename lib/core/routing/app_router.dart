import 'package:flutter/material.dart';
import 'package:goldy_app/core/presentation/home_view.dart';
import 'package:goldy_app/core/routing/routes.dart';
import 'package:goldy_app/features/gold/presentation/views/gold_view.dart';
import 'package:goldy_app/features/silver/presentation/views/silver_view.dart';

abstract class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeView:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeView();
          },
        );

      case AppRoutes.goldView:
        return MaterialPageRoute(
          builder: (context) {
            return const GoldView();
          },
        );

      case AppRoutes.silverView:
        return MaterialPageRoute(
          builder: (context) {
            return const SilverView();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No routes defined for ${settings.name}')),
          ),
        );
    }
  }
}
