import 'package:flutter/material.dart';
import 'package:goldy_app/core/networking/dio_helper.dart';
import 'package:goldy_app/core/routing/app_router.dart';
import 'package:goldy_app/core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeView,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
